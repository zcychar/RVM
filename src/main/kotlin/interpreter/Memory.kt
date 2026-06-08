package interpreter

import backend.ir.IrArray
import backend.ir.IrPointer
import backend.ir.IrPrimitive
import backend.ir.IrStruct
import backend.ir.IrType
import backend.ir.PrimitiveKind

class Memory {
    private data class MemoryObject(
        val type: IrType,
        val slots: MutableMap<List<Int>, RuntimeValue> = mutableMapOf(),
    )

    private val objects = mutableMapOf<Int, MemoryObject>()
    private var nextObjectId = 1

    fun allocate(type: IrType): PointerValue {
        val id = nextObjectId++
        objects[id] = MemoryObject(type)
        return PointerValue(id, emptyList(), type)
    }

    fun load(pointer: PointerValue, type: IrType): RuntimeValue {
        val obj = objectFor(pointer)
        return obj.slots[pointer.path] ?: defaultValue(type)
    }

    fun store(pointer: PointerValue, value: RuntimeValue) {
        val obj = objectFor(pointer)
        obj.slots[pointer.path] = value
    }

    fun copy(dest: PointerValue, src: PointerValue) {
        if (dest.objectId == src.objectId && dest.path == src.path) return

        val srcObj = objectFor(src)
        val destObj = objectFor(dest)
        val copied = srcObj.slots
            .filterKeys { it.startsWith(src.path) }
            .map { (path, value) -> dest.path + path.drop(src.path.size) to value }

        destObj.slots.keys.filter { it.startsWith(dest.path) }.toList().forEach {
            destObj.slots.remove(it)
        }
        copied.forEach { (path, value) ->
            destObj.slots[path] = value
        }
    }

    fun bitcast(pointer: PointerValue, type: IrType): PointerValue =
        pointer.copy(pointeeType = (type as? IrPointer)?.pointee ?: pointer.pointeeType)

    private fun objectFor(pointer: PointerValue): MemoryObject =
        objects[pointer.objectId] ?: error("invalid pointer object ${pointer.objectId}")

    private fun defaultValue(type: IrType): RuntimeValue = when (type) {
        is IrPrimitive -> IntValue(0)
        is IrPointer -> UnitValue
        is IrArray, is IrStruct -> UnitValue
        else -> UnitValue
    }
}

private fun List<Int>.startsWith(prefix: List<Int>): Boolean {
    if (prefix.size > size) return false
    for (i in prefix.indices) {
        if (this[i] != prefix[i]) return false
    }
    return true
}

