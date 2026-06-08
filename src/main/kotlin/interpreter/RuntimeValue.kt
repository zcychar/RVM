package interpreter

import backend.ir.IrType

sealed interface RuntimeValue

data class IntValue(val value: Long) : RuntimeValue

data class PointerValue(
    val objectId: Int,
    val path: List<Int> = emptyList(),
    val pointeeType: IrType,
) : RuntimeValue

data object UnitValue : RuntimeValue

