package jit

import java.security.MessageDigest

internal fun alignUp(value: Int, alignment: Int): Int {
    if (alignment <= 1) return value
    return ((value + alignment - 1) / alignment) * alignment
}

internal fun safeName(name: String): String =
    name.replace(Regex("[^A-Za-z0-9_.-]"), "_").take(80)

internal fun hashString(value: String): String {
    val digest = MessageDigest.getInstance("SHA-256").digest(value.toByteArray())
    return digest.joinToString("") { "%02x".format(it) }.take(16)
}
