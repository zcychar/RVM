package jit

import backend.ir.*

internal class JitClosureAnalyzer(module: IrModule) {
    private val functions = module.declaredFunctions().associateBy { it.name }

    fun buildClosure(root: IrFunction): List<IrFunction>? {
        val ordered = mutableListOf<IrFunction>()
        val visited = mutableSetOf<String>()
        val visiting = mutableSetOf<String>()

        fun visit(function: IrFunction): Boolean {
            if (function.name in visited) return true
            if (function.name in visiting) return true

            visiting.add(function.name)
            for (calleeName in directUserCallees(function)) {
                val callee = functions[calleeName] ?: return false
                if (!visit(callee)) return false
            }
            visiting.remove(function.name)
            visited.add(function.name)
            ordered.add(function)
            return true
        }

        return if (visit(root)) ordered else null
    }

    fun isEligibleFunction(function: IrFunction): Boolean {
        for (instruction in function.blocks.flatMap { it.instructions + listOfNotNull(it.terminator) }) {
            if (!isEligibleInstruction(instruction)) return false
        }
        return true
    }

    fun directUserCallees(function: IrFunction): Set<String> =
        function.blocks
            .flatMap { block -> block.instructions.filterIsInstance<IrCall>() }
            .map { it.callee.name }
            .filterTo(linkedSetOf()) { it in functions }

    private fun isEligibleInstruction(instruction: IrInstruction): Boolean {
        if (usedValues(instruction).any { it is IrGlobalRef }) return false
        if (usedValues(instruction).any { it is IrFunctionRef && instruction !is IrCall }) return false
        if (instruction is IrCall) {
            val callee = instruction.callee.name
            if (callee in functions) return true
            return callee == MEMCPY_INTRINSIC
        }
        return true
    }

    private fun usedValues(instruction: IrInstruction): List<IrValue> = when (instruction) {
        is IrAlloca -> emptyList()
        is IrConst -> emptyList()
        is IrLoad -> listOf(instruction.address)
        is IrStore -> listOf(instruction.address, instruction.value)
        is IrBinary -> listOf(instruction.lhs, instruction.rhs)
        is IrUnary -> listOf(instruction.operand)
        is IrCmp -> listOf(instruction.lhs, instruction.rhs)
        is IrCall -> listOf(instruction.callee) + instruction.arguments
        is IrGep -> listOf(instruction.base) + instruction.indices
        is IrPhi -> instruction.incoming.map { it.value }
        is IrCast -> listOf(instruction.value)
        is IrReturn -> instruction.value?.let(::listOf) ?: emptyList()
        is IrBranch -> listOf(instruction.condition)
        is IrJump -> emptyList()
        is IrTerminator -> emptyList()
    }

    companion object {
        private const val MEMCPY_INTRINSIC = "llvm.memcpy.p0.p0.i32"
    }
}
