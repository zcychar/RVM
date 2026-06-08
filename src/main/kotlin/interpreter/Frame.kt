package interpreter

import backend.ir.IrBasicBlock
import backend.ir.IrFunction

class Frame(
    val function: IrFunction,
    val args: List<RuntimeValue>,
) {
    val locals: MutableMap<String, RuntimeValue> = mutableMapOf()
    val blocks: Map<String, IrBasicBlock> = function.blocks.associateBy { it.label }
    var currentBlock: IrBasicBlock = function.blocks.firstOrNull()
        ?: error("function ${function.name} has no entry block")
    var predecessor: String? = null

    init {
        function.parameterNames.forEachIndexed { index, name ->
            if (name.isNotEmpty()) {
                locals[name] = args.getOrElse(index) { UnitValue }
            }
        }
    }

    fun block(label: String): IrBasicBlock =
        blocks[label] ?: error("function ${function.name} has no block $label")
}

