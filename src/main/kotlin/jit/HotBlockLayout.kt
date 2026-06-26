package jit

import backend.ir.IrBasicBlock
import backend.ir.IrBranch
import backend.ir.IrFunction
import backend.ir.IrJump
import profiler.BlockEdge
import profiler.MethodProfile

internal object HotBlockLayout {
    data class Result(
        val function: IrFunction,
        val order: List<String>,
    )

    fun apply(function: IrFunction, profile: MethodProfile?): Result {
        if (function.blocks.size <= 1 || profile == null || profile.blockEdges.isEmpty()) {
            return Result(function, function.blocks.map { it.label })
        }

        val originalBlocks = function.blocks
        val originalIndex = originalBlocks.withIndex().associate { (index, block) -> block.label to index }
        val blocksByLabel = originalBlocks.associateBy { it.label }
        val placed = linkedSetOf<String>()
        val ordered = mutableListOf<IrBasicBlock>()

        fun placeTrace(seed: IrBasicBlock) {
            var current: IrBasicBlock? = seed
            while (current != null && placed.add(current.label)) {
                ordered.add(current)
                current = hottestUnplacedSuccessor(current, profile, blocksByLabel, originalIndex, placed)
            }
        }

        placeTrace(originalBlocks.first())
        while (ordered.size < originalBlocks.size) {
            val seed = originalBlocks
                .filter { it.label !in placed }
                .maxWithOrNull(
                    compareBy<IrBasicBlock> { blockHeat(it, profile) }
                        .thenBy { -originalIndex.getValue(it.label) },
                )
                ?: break
            placeTrace(seed)
        }

        val order = ordered.map { it.label }
        if (order == originalBlocks.map { it.label }) {
            return Result(function, order)
        }

        return Result(copyWithBlockOrder(function, ordered), order)
    }

    private fun hottestUnplacedSuccessor(
        block: IrBasicBlock,
        profile: MethodProfile,
        blocksByLabel: Map<String, IrBasicBlock>,
        originalIndex: Map<String, Int>,
        placed: Set<String>,
    ): IrBasicBlock? {
        val candidates = successors(block)
            .asSequence()
            .filter { it !in placed }
            .mapNotNull { blocksByLabel[it] }
            .toList()
        if (candidates.isEmpty()) return null

        val hottest = candidates.maxWithOrNull(
            compareBy<IrBasicBlock> { edgeCount(profile, block.label, it.label) }
                .thenBy { -originalIndex.getValue(it.label) },
        ) ?: return null

        return hottest.takeIf { edgeCount(profile, block.label, it.label) > 0 }
    }

    private fun successors(block: IrBasicBlock): List<String> = when (val terminator = block.terminator) {
        is IrBranch -> listOf(terminator.trueTarget, terminator.falseTarget).distinct()
        is IrJump -> listOf(terminator.target)
        else -> emptyList()
    }

    private fun blockHeat(block: IrBasicBlock, profile: MethodProfile): Long =
        profile.blockEdges.entries.sumOf { (edge, count) ->
            if (edge.from == block.label || edge.to == block.label) count else 0
        }

    private fun edgeCount(profile: MethodProfile, from: String, to: String): Long =
        profile.blockEdges[BlockEdge(from, to)] ?: 0

    private fun copyWithBlockOrder(function: IrFunction, blocks: List<IrBasicBlock>): IrFunction {
        val copy = IrFunction(function.name, function.signature, function.parameterNames)
        blocks.forEach(copy::appendBlock)
        return copy
    }
}
