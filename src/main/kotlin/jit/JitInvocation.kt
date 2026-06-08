package jit

import backend.ir.IrPrimitive
import backend.ir.IrType
import backend.ir.PrimitiveKind
import interpreter.IntValue
import interpreter.Memory
import interpreter.PointerValue
import interpreter.RuntimeValue
import interpreter.UnitValue
import java.io.ByteArrayOutputStream

internal class JitInvocation private constructor(
    private val abi: EntryAbi,
    val input: ByteArray,
    private val pointerGroups: List<PointerGroup>,
    private val memory: Memory,
) {
    fun applyOutput(output: ByteArray): RuntimeValue? {
        val expected = Long.SIZE_BYTES + abi.arenaSize
        if (output.size < expected) return null
        val returnRaw = readLong(output, 0)
        val arena = output.copyOfRange(Long.SIZE_BYTES, expected)
        pointerGroups.forEach { group ->
            val bytes = arena.copyOfRange(group.offset, group.offset + group.size)
            memory.writeBytes(group.pointer, bytes, group.type)
        }
        return runtimeReturnValue(returnRaw, abi.returnType)
    }

    companion object {
        fun prepare(abi: EntryAbi, args: List<RuntimeValue>, memory: Memory): JitInvocation? {
            if (args.size != abi.parameters.size) return null

            val pointerGroups = abi.parameters
                .filterIsInstance<ParameterAbi.Pointer>()
                .mapNotNull { param ->
                    val pointer = args[param.index] as? PointerValue ?: return null
                    PointerParam(param, pointer)
                }
                .groupBy { "${it.pointer.objectId}:${it.pointer.path.joinToString(".")}" }
                .values
                .map { group ->
                    val canonical = group.maxWith(compareBy<PointerParam> { it.param.size }.thenBy { it.param.alignment })
                    PointerGroup(
                        pointer = canonical.pointer,
                        type = canonical.param.pointeeType,
                        size = canonical.param.size,
                        offset = canonical.param.staticOffset,
                        params = group.map { it.param },
                    )
                }

            val groupByParam = mutableMapOf<Int, PointerGroup>()
            pointerGroups.forEach { group ->
                group.params.forEach { groupByParam[it.index] = group }
            }

            val arena = ByteArray(abi.arenaSize)
            for (group in pointerGroups) {
                val bytes = memory.toBytes(group.pointer, group.type)
                bytes.copyInto(arena, destinationOffset = group.offset)
            }

            val input = ByteArrayOutputStream()
            for (param in abi.parameters) {
                when (param) {
                    is ParameterAbi.Scalar -> {
                        val value = args[param.index] as? IntValue ?: return null
                        input.writeLong(value.value)
                    }
                    is ParameterAbi.Pointer -> {
                        val group = groupByParam[param.index] ?: return null
                        input.writeLong(group.offset.toLong())
                    }
                }
            }
            input.write(arena)
            return JitInvocation(abi, input.toByteArray(), pointerGroups, memory)
        }
    }
}

private data class PointerParam(
    val param: ParameterAbi.Pointer,
    val pointer: PointerValue,
)

private data class PointerGroup(
    val pointer: PointerValue,
    val type: IrType,
    val size: Int,
    val offset: Int,
    val params: List<ParameterAbi.Pointer>,
)

private fun ByteArrayOutputStream.writeLong(value: Long) {
    for (i in 0 until Long.SIZE_BYTES) {
        write(((value ushr (8 * i)) and 0xffL).toInt())
    }
}

private fun readLong(bytes: ByteArray, offset: Int): Long {
    var value = 0L
    for (i in 0 until Long.SIZE_BYTES) {
        value = value or ((bytes[offset + i].toLong() and 0xffL) shl (8 * i))
    }
    return value
}

private fun runtimeReturnValue(raw: Long, type: IrType): RuntimeValue = when ((type as? IrPrimitive)?.kind) {
    PrimitiveKind.BOOL -> IntValue(if ((raw and 1L) == 0L) 0 else 1)
    PrimitiveKind.CHAR -> IntValue(raw and 0xffL)
    PrimitiveKind.I32, PrimitiveKind.U32, PrimitiveKind.ISIZE, PrimitiveKind.USIZE -> IntValue(raw.toInt().toLong())
    PrimitiveKind.UNIT, PrimitiveKind.NEVER -> UnitValue
    null -> UnitValue
}
