package jit

import backend.codegen.AsmEmitter
import backend.codegen.BranchRelaxation
import backend.codegen.FallthroughJumpElimination
import backend.codegen.FrameLayout
import backend.codegen.GraphColorRegAlloc
import backend.codegen.InstructionSelector
import backend.ir.IrFunction
import backend.ir.IrModule

internal class FunctionCompiler(private val module: IrModule) {
    fun compile(function: IrFunction): String {
        val selector = InstructionSelector(module)
        val machineFunction = selector.select(function)
        GraphColorRegAlloc().allocate(machineFunction)
        FrameLayout.run(machineFunction)
        BranchRelaxation.relax(machineFunction)
        FallthroughJumpElimination.run(machineFunction)

        return buildString {
            appendLine("    .option nopic")
            appendLine("    .text")
            appendLine("    .globl ${function.name}")
            append(AsmEmitter.emitFunction(machineFunction))
        }
    }
}
