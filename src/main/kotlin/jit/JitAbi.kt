package jit

import backend.ir.*

internal data class EntryAbi(
    val rootName: String,
    val parameters: List<ParameterAbi>,
    val returnType: IrType,
    val arenaSize: Int,
) {
    fun render(): String = buildString {
        append(rootName).append(':').append(returnType.render()).append(':').append(arenaSize).append(':')
        parameters.forEach {
            append(it.render()).append(';')
        }
    }

    companion object {
        fun from(function: IrFunction): EntryAbi? {
            val actualReturnType = function.signature.actualReturnType
            if (!isMarshalableReturnType(actualReturnType)) return null

            var arenaOffset = 0
            val params = mutableListOf<ParameterAbi>()
            for ((index, type) in function.signature.parameters.withIndex()) {
                when (type) {
                    is IrPrimitive -> params.add(ParameterAbi.Scalar(index, type))
                    is IrPointer -> {
                        if (!isMarshalableMemoryType(type.pointee)) return null
                        val (size, align) = typeLayout(type.pointee)
                        arenaOffset = alignUp(arenaOffset, align)
                        params.add(ParameterAbi.Pointer(index, type.pointee, size, align, arenaOffset))
                        arenaOffset += size
                    }
                    else -> return null
                }
            }
            return EntryAbi(function.name, params, actualReturnType, arenaOffset)
        }
    }
}

internal sealed interface ParameterAbi {
    val index: Int

    fun render(): String

    data class Scalar(
        override val index: Int,
        val type: IrPrimitive,
    ) : ParameterAbi {
        override fun render(): String = "s$index:${type.render()}"
    }

    data class Pointer(
        override val index: Int,
        val pointeeType: IrType,
        val size: Int,
        val alignment: Int,
        val staticOffset: Int,
    ) : ParameterAbi {
        override fun render(): String = "p$index:${pointeeType.render()}:$size:$alignment:$staticOffset"
    }
}

private fun isMarshalableReturnType(type: IrType): Boolean =
    type is IrPrimitive

private fun isMarshalableMemoryType(type: IrType): Boolean = when (type) {
    is IrPrimitive -> true
    is IrArray -> isMarshalableMemoryType(type.element)
    is IrStruct -> type.fields.all(::isMarshalableMemoryType)
    is IrPointer -> false
    else -> false
}
