package interpreter

import backend.ir.IrArray
import backend.ir.IrPointer
import backend.ir.IrPrimitive
import backend.ir.IrStruct
import backend.ir.IrType
import backend.ir.PrimitiveKind
import backend.ir.typeLayout
import backend.ir.typeSize

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

    fun toBytes(pointer: PointerValue, type: IrType = pointer.pointeeType): ByteArray {
        val bytes = ByteArray(typeSize(type))
        writeValueToBytes(bytes, 0, pointer, type)
        return bytes
    }

    fun writeBytes(pointer: PointerValue, bytes: ByteArray, type: IrType = pointer.pointeeType) {
        require(bytes.size >= typeSize(type)) {
            "not enough bytes for ${type.render()}: got ${bytes.size}, need ${typeSize(type)}"
        }
        readValueFromBytes(bytes, 0, pointer, type)
    }

    private fun objectFor(pointer: PointerValue): MemoryObject =
        objects[pointer.objectId] ?: error("invalid pointer object ${pointer.objectId}")

    private fun defaultValue(type: IrType): RuntimeValue = when (type) {
        is IrPrimitive -> IntValue(0)
        is IrPointer -> UnitValue
        is IrArray, is IrStruct -> UnitValue
        else -> UnitValue
    }

    private fun writeValueToBytes(bytes: ByteArray, baseOffset: Int, pointer: PointerValue, type: IrType) {
        when (type) {
            is IrPrimitive -> writePrimitive(bytes, baseOffset, type, load(pointer, type))
            is IrArray -> {
                val (elementSize, elementAlign) = typeLayout(type.element)
                val stride = alignUp(elementSize, elementAlign)
                for (index in 0 until type.length) {
                    writeValueToBytes(bytes, baseOffset + index * stride, pointer.copy(path = pointer.path + index), type.element)
                }
            }
            is IrStruct -> {
                var offset = baseOffset
                type.fields.forEachIndexed { index, field ->
                    val (_, fieldAlign) = typeLayout(field)
                    offset = alignUp(offset - baseOffset, fieldAlign) + baseOffset
                    writeValueToBytes(bytes, offset, pointer.copy(path = pointer.path + index), field)
                    offset += typeSize(field)
                }
            }
            is IrPointer -> error("cannot marshal pointer value inside memory object")
            else -> Unit
        }
    }

    private fun readValueFromBytes(bytes: ByteArray, baseOffset: Int, pointer: PointerValue, type: IrType) {
        when (type) {
            is IrPrimitive -> store(pointer, readPrimitive(bytes, baseOffset, type))
            is IrArray -> {
                val (elementSize, elementAlign) = typeLayout(type.element)
                val stride = alignUp(elementSize, elementAlign)
                for (index in 0 until type.length) {
                    readValueFromBytes(bytes, baseOffset + index * stride, pointer.copy(path = pointer.path + index), type.element)
                }
            }
            is IrStruct -> {
                var offset = baseOffset
                type.fields.forEachIndexed { index, field ->
                    val (_, fieldAlign) = typeLayout(field)
                    offset = alignUp(offset - baseOffset, fieldAlign) + baseOffset
                    readValueFromBytes(bytes, offset, pointer.copy(path = pointer.path + index), field)
                    offset += typeSize(field)
                }
            }
            is IrPointer -> error("cannot unmarshal pointer value inside memory object")
            else -> Unit
        }
    }

    private fun writePrimitive(bytes: ByteArray, offset: Int, type: IrPrimitive, value: RuntimeValue) {
        val raw = when (value) {
            is IntValue -> value.value
            UnitValue -> 0
            is PointerValue -> error("cannot marshal pointer as primitive")
        }
        when (type.kind) {
            PrimitiveKind.BOOL -> bytes[offset] = (raw and 1L).toByte()
            PrimitiveKind.CHAR -> bytes[offset] = (raw and 0xffL).toByte()
            PrimitiveKind.I32, PrimitiveKind.U32, PrimitiveKind.ISIZE, PrimitiveKind.USIZE -> {
                val intValue = raw.toInt()
                for (i in 0 until 4) {
                    bytes[offset + i] = (intValue ushr (8 * i)).toByte()
                }
            }
            PrimitiveKind.UNIT, PrimitiveKind.NEVER -> Unit
        }
    }

    private fun readPrimitive(bytes: ByteArray, offset: Int, type: IrPrimitive): RuntimeValue {
        val value = when (type.kind) {
            PrimitiveKind.BOOL -> if ((bytes[offset].toInt() and 1) == 0) 0L else 1L
            PrimitiveKind.CHAR -> (bytes[offset].toInt() and 0xff).toLong()
            PrimitiveKind.I32, PrimitiveKind.U32, PrimitiveKind.ISIZE, PrimitiveKind.USIZE -> {
                var raw = 0
                for (i in 0 until 4) {
                    raw = raw or ((bytes[offset + i].toInt() and 0xff) shl (8 * i))
                }
                raw.toLong()
            }
            PrimitiveKind.UNIT, PrimitiveKind.NEVER -> 0L
        }
        return IntValue(value)
    }

    private fun alignUp(value: Int, alignment: Int): Int {
        if (alignment <= 1) return value
        return ((value + alignment - 1) / alignment) * alignment
    }
}

private fun List<Int>.startsWith(prefix: List<Int>): Boolean {
    if (prefix.size > size) return false
    for (i in prefix.indices) {
        if (this[i] != prefix[i]) return false
    }
    return true
}
