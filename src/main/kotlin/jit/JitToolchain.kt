package jit

import java.nio.file.Files
import java.nio.file.Path
import kotlin.io.path.absolutePathString
import kotlin.io.path.exists

data class JitToolchain(
    val assembler: String,
    val linker: String,
    val qemu: String,
    val available: Boolean,
) {
    companion object {
        fun detect(): JitToolchain {
            val assembler = findExecutable("riscv64-unknown-elf-as")
            val linker = findExecutable("riscv64-unknown-elf-ld")
            val qemu = findExecutable("qemu-riscv64")
                ?: Path.of("/home/zcychar/qemu-7.0.0/build/qemu-riscv64").takeIf { it.exists() }?.absolutePathString()
            return JitToolchain(
                assembler = assembler ?: "riscv64-unknown-elf-as",
                linker = linker ?: "riscv64-unknown-elf-ld",
                qemu = qemu ?: "qemu-riscv64",
                available = assembler != null && linker != null && qemu != null,
            )
        }

        private fun findExecutable(name: String): String? {
            val path = System.getenv("PATH") ?: return null
            return path.split(System.getProperty("path.separator")).asSequence()
                .map { Path.of(it).resolve(name) }
                .firstOrNull { Files.isExecutable(it) }
                ?.absolutePathString()
        }
    }
}
