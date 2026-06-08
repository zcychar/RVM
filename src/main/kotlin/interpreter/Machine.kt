package interpreter

import backend.ir.BinaryOperator
import backend.ir.CastKind
import backend.ir.ComparePredicate
import backend.ir.IrAlloca
import backend.ir.IrArray
import backend.ir.IrBasicBlock
import backend.ir.IrBinary
import backend.ir.IrBranch
import backend.ir.IrCall
import backend.ir.IrCast
import backend.ir.IrCmp
import backend.ir.IrConst
import backend.ir.IrConstant
import backend.ir.IrFunction
import backend.ir.IrFunctionRef
import backend.ir.IrGep
import backend.ir.IrGlobal
import backend.ir.IrGlobalRef
import backend.ir.IrInstruction
import backend.ir.IrJump
import backend.ir.IrLoad
import backend.ir.IrLocal
import backend.ir.IrModule
import backend.ir.IrParameter
import backend.ir.IrPhi
import backend.ir.IrPointer
import backend.ir.IrPrimitive
import backend.ir.IrReturn
import backend.ir.IrStore
import backend.ir.IrStruct
import backend.ir.IrTerminator
import backend.ir.IrType
import backend.ir.IrUndef
import backend.ir.IrUnary
import backend.ir.IrValue
import backend.ir.PhiBranch
import backend.ir.PrimitiveKind
import backend.ir.UnaryOperator
import jit.JitManager
import profiler.Profiler
import java.io.InputStream
import java.util.Scanner

class Machine(
    private val module: IrModule,
    input: InputStream,
    private val output: Appendable,
    private val profiler: Profiler? = null,
    private val jitManager: JitManager? = null,
) {
    private val memory = Memory()
    private val inputScanner = Scanner(input)
    private val functions = module.declaredFunctions().associateBy { it.name }
    private val blockIndexes = functions.mapValues { (_, function) ->
        function.blocks.withIndex().associate { (index, block) -> block.label to index }
    }

    fun runMain(): Int {
        val main = functions["main"] ?: error("main function not found")
        return try {
            val ret = call(main, emptyList())
            if (ret is IntValue) ret.value.toInt() else 0
        } catch (exit: ProgramExit) {
            exit.code
        }
    }

    private fun call(function: IrFunction, args: List<RuntimeValue>): RuntimeValue {
        profiler?.recordCall(function.name)
        if (jitManager != null && (profiler == null || profiler.isHot(function.name))) {
            jitManager.invoke(function, args, memory)?.let { return it }
        }
        val frame = Frame(function, args)
        while (true) {
            val block = frame.currentBlock
            executePhis(block, frame)
            block.instructions.asSequence()
                .filter { it !is IrPhi }
                .forEach { executeInstruction(it, frame) }

            when (val step = executeTerminator(block.terminator ?: error("block ${block.label} has no terminator"), frame)) {
                is Step.Return -> return step.value
                is Step.Next -> {
                    if (isBackEdge(function, block.label, step.label)) {
                        profiler?.recordBackEdge(function.name)
                    }
                    frame.predecessor = block.label
                    frame.currentBlock = frame.block(step.label)
                }
            }
        }
    }

    private fun executePhis(block: IrBasicBlock, frame: Frame) {
        val values = block.instructions.filterIsInstance<IrPhi>().associate { phi ->
            profiler?.recordInstruction(frame.function.name)
            phi.name to evalPhi(phi, frame)
        }
        frame.locals.putAll(values)
    }

    private fun executeInstruction(instruction: IrInstruction, frame: Frame) {
        profiler?.recordInstruction(frame.function.name)
        val value = when (instruction) {
            is IrConst -> runtimeConstant(instruction.constant)
            is IrAlloca -> memory.allocate(instruction.allocatedType)
            is IrLoad -> memory.load(evalPointer(instruction.address, frame), instruction.type)
            is IrStore -> {
                memory.store(evalPointer(instruction.address, frame), evalValue(instruction.value, frame))
                UnitValue
            }
            is IrBinary -> evalBinary(instruction, frame)
            is IrUnary -> evalUnary(instruction, frame)
            is IrCmp -> evalCmp(instruction, frame)
            is IrCall -> evalCall(instruction, frame)
            is IrGep -> evalGep(instruction, frame)
            is IrCast -> evalCast(instruction, frame)
            is IrPhi -> evalPhi(instruction, frame)
            is IrTerminator -> error("terminator reached in instruction stream")
        }
        if (instruction.name.isNotBlank()) {
            frame.locals[instruction.name] = value
        }
    }

    private fun isBackEdge(function: IrFunction, from: String, to: String): Boolean {
        val indexes = blockIndexes[function.name] ?: return false
        val fromIndex = indexes[from] ?: return false
        val toIndex = indexes[to] ?: return false
        return toIndex <= fromIndex
    }

    private fun executeTerminator(terminator: IrTerminator, frame: Frame): Step {
        profiler?.recordInstruction(frame.function.name)
        return when (terminator) {
            is IrReturn -> Step.Return(terminator.value?.let { evalValue(it, frame) } ?: UnitValue)
            is IrBranch -> if (evalInt(terminator.condition, frame) != 0L) {
                Step.Next(terminator.trueTarget)
            } else {
                Step.Next(terminator.falseTarget)
            }
            is IrJump -> Step.Next(terminator.target)
        }
    }

    private fun evalCall(call: IrCall, frame: Frame): RuntimeValue {
        val args = call.arguments.map { evalValue(it, frame) }
        return when (call.callee.name) {
            "getInt." -> IntValue(readInt())
            "printInt." -> {
                output.append(args[0].asSignedInt().toString())
                UnitValue
            }
            "printlnInt." -> {
                output.append(args[0].asSignedInt().toString()).append('\n')
                UnitValue
            }
            "exit." -> throw ProgramExit(args[0].asSignedInt())
            "llvm.memcpy.p0.p0.i32" -> {
                memory.copy(args[0].asPointer(), args[1].asPointer())
                UnitValue
            }
            else -> {
                val target = functions[call.callee.name] ?: error("unknown function ${call.callee.name}")
                call(target, args)
            }
        }
    }

    private fun evalBinary(binary: IrBinary, frame: Frame): RuntimeValue {
        val lhs = evalInt(binary.lhs, frame)
        val rhs = evalInt(binary.rhs, frame)
        val result = when (binary.operator) {
            BinaryOperator.ADD -> lhs + rhs
            BinaryOperator.SUB -> lhs - rhs
            BinaryOperator.MUL -> lhs * rhs
            BinaryOperator.SDIV -> lhs.toInt() / rhs.toInt()
            BinaryOperator.UDIV -> Integer.divideUnsigned(lhs.toInt(), rhs.toInt())
            BinaryOperator.SREM -> lhs.toInt() % rhs.toInt()
            BinaryOperator.UREM -> Integer.remainderUnsigned(lhs.toInt(), rhs.toInt())
            BinaryOperator.AND -> lhs.toInt() and rhs.toInt()
            BinaryOperator.OR -> lhs.toInt() or rhs.toInt()
            BinaryOperator.XOR -> lhs.toInt() xor rhs.toInt()
            BinaryOperator.SHL -> lhs.toInt() shl (rhs.toInt() and 31)
            BinaryOperator.ASHR -> lhs.toInt() shr (rhs.toInt() and 31)
            BinaryOperator.LSHR -> lhs.toInt() ushr (rhs.toInt() and 31)
        }.toLong()
        return IntValue(normalize(result, binary.type))
    }

    private fun evalUnary(unary: IrUnary, frame: Frame): RuntimeValue {
        val operand = evalInt(unary.operand, frame)
        val result = when (unary.operator) {
            UnaryOperator.NEG -> -operand
            UnaryOperator.NOT -> {
                if ((unary.type as? IrPrimitive)?.kind == PrimitiveKind.BOOL) {
                    if (operand == 0L) 1L else 0L
                } else {
                    operand.toInt().inv().toLong()
                }
            }
        }
        return IntValue(normalize(result, unary.type))
    }

    private fun evalCmp(cmp: IrCmp, frame: Frame): RuntimeValue {
        val lhs = evalInt(cmp.lhs, frame).toInt()
        val rhs = evalInt(cmp.rhs, frame).toInt()
        val ok = when (cmp.predicate) {
            ComparePredicate.EQ -> lhs == rhs
            ComparePredicate.NE -> lhs != rhs
            ComparePredicate.SLT -> lhs < rhs
            ComparePredicate.SLE -> lhs <= rhs
            ComparePredicate.SGT -> lhs > rhs
            ComparePredicate.SGE -> lhs >= rhs
            ComparePredicate.ULT -> Integer.compareUnsigned(lhs, rhs) < 0
            ComparePredicate.ULE -> Integer.compareUnsigned(lhs, rhs) <= 0
            ComparePredicate.UGT -> Integer.compareUnsigned(lhs, rhs) > 0
            ComparePredicate.UGE -> Integer.compareUnsigned(lhs, rhs) >= 0
        }
        return IntValue(if (ok) 1 else 0)
    }

    private fun evalCast(cast: IrCast, frame: Frame): RuntimeValue {
        val value = evalValue(cast.value, frame)
        if (value is PointerValue && cast.type is IrPointer) {
            return memory.bitcast(value, cast.type)
        }
        if (value is PointerValue && cast.kind == CastKind.PTRTOINT) {
            return IntValue(value.objectId.toLong())
        }
        if (value is IntValue && cast.kind == CastKind.INTTOPTR && cast.type is IrPointer) {
            return PointerValue(value.value.toInt(), emptyList(), cast.type.pointee)
        }
        return IntValue(normalize(value.asLong(), cast.type, cast.kind, cast.value.type))
    }

    private fun evalGep(gep: IrGep, frame: Frame): RuntimeValue {
        val base = evalPointer(gep.base, frame)
        val path = base.path.toMutableList()
        var current = base.pointeeType

        gep.indices.map { evalInt(it, frame).toInt() }.forEachIndexed { indexPosition, index ->
            if (indexPosition == 0 && index == 0 && (current is IrArray || current is IrStruct)) {
                return@forEachIndexed
            }
            when (val type = current) {
                is IrArray -> {
                    path.add(index)
                    current = type.element
                }
                is IrStruct -> {
                    path.add(index)
                    current = type.fields[index]
                }
                is IrPointer -> current = type.pointee
                else -> path.add(index)
            }
        }

        return PointerValue(base.objectId, path, (gep.type as IrPointer).pointee)
    }

    private fun evalPhi(phi: IrPhi, frame: Frame): RuntimeValue {
        val predecessor = frame.predecessor ?: phi.incoming.firstOrNull()?.predecessor
        val branch = phi.incoming.firstOrNull { it.predecessor == predecessor }
            ?: error("phi ${phi.name} has no incoming value from $predecessor")
        return evalValue(branch.value, frame)
    }

    private fun evalValue(value: IrValue, frame: Frame): RuntimeValue = when (value) {
        is IrConstant -> runtimeConstant(value)
        is IrLocal -> frame.locals[value.name] ?: error("undefined local %${value.name} in ${frame.function.name}")
        is IrParameter -> frame.args.getOrElse(value.index) { UnitValue }
        is IrGlobal -> runtimeConstant(value.initializer)
        is IrGlobalRef -> module.getGlobalByName(value.name)?.let { runtimeConstant(it) } ?: UnitValue
        is IrFunctionRef -> error("function value ${value.name} is not executable data")
        is IrUndef -> IntValue(0)
    }

    private fun evalPointer(value: IrValue, frame: Frame): PointerValue =
        evalValue(value, frame).asPointer()

    private fun evalInt(value: IrValue, frame: Frame): Long =
        evalValue(value, frame).asLong()

    private fun runtimeConstant(value: IrConstant): RuntimeValue =
        IntValue(normalize(value.value, value.type))

    private fun readInt(): Long =
        if (inputScanner.hasNextLong()) normalize(inputScanner.nextLong(), IrPrimitive(PrimitiveKind.I32)) else 0

    private sealed interface Step {
        data class Next(val label: String) : Step
        data class Return(val value: RuntimeValue) : Step
    }

    private class ProgramExit(val code: Int) : RuntimeException(null, null, false, false)
}

private fun RuntimeValue.asPointer(): PointerValue = this as? PointerValue
    ?: error("expected pointer value, got $this")

private fun RuntimeValue.asLong(): Long = when (this) {
    is IntValue -> value
    is UnitValue -> 0
    is PointerValue -> objectId.toLong()
}

private fun RuntimeValue.asSignedInt(): Int = asLong().toInt()

private fun normalize(value: Long, type: IrType): Long = when ((type as? IrPrimitive)?.kind) {
    PrimitiveKind.BOOL -> if ((value and 1L) == 0L) 0 else 1
    PrimitiveKind.CHAR -> value and 0xffL
    PrimitiveKind.I32, PrimitiveKind.U32, PrimitiveKind.ISIZE, PrimitiveKind.USIZE -> value.toInt().toLong()
    else -> value
}

private fun normalize(value: Long, targetType: IrType, kind: CastKind, sourceType: IrType): Long {
    val target = targetType as? IrPrimitive ?: return value
    val raw = when (kind) {
        CastKind.TRUNC -> truncate(value, bitWidth(target))
        CastKind.ZEXT -> truncate(value, bitWidth(sourceType as? IrPrimitive ?: target))
        CastKind.SEXT -> signExtend(value, bitWidth(sourceType as? IrPrimitive ?: target))
        else -> value
    }
    return normalize(raw, targetType)
}

private fun bitWidth(type: IrPrimitive): Int = when (type.kind) {
    PrimitiveKind.BOOL -> 1
    PrimitiveKind.CHAR -> 8
    PrimitiveKind.I32, PrimitiveKind.U32, PrimitiveKind.ISIZE, PrimitiveKind.USIZE -> 32
    PrimitiveKind.UNIT, PrimitiveKind.NEVER -> 0
}

private fun truncate(value: Long, bits: Int): Long {
    if (bits <= 0) return 0
    if (bits >= 64) return value
    return value and ((1L shl bits) - 1)
}

private fun signExtend(value: Long, bits: Int): Long {
    val truncated = truncate(value, bits)
    if (bits <= 0 || bits >= 64) return truncated
    val sign = 1L shl (bits - 1)
    return if ((truncated and sign) == 0L) truncated else truncated or (-1L shl bits)
}
