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
            val assembler = findFirstExecutable("riscv64-unknown-elf-as", "riscv64-elf-as")
            val linker = findFirstExecutable("riscv64-unknown-elf-ld", "riscv64-elf-ld")
            val qemu = findFirstExecutable("qemu-riscv64", "qemu-riscv64-static")
                ?: Path.of("/home/zcychar/qemu-7.0.0/build/qemu-riscv64").takeIf { it.exists() }?.absolutePathString()
            return JitToolchain(
                assembler = assembler ?: "riscv64-unknown-elf-as",
                linker = linker ?: "riscv64-unknown-elf-ld",
                qemu = qemu ?: "qemu-riscv64",
                available = assembler != null && linker != null && qemu != null,
            )
        }

        private fun findFirstExecutable(vararg names: String): String? =
            names.firstNotNullOfOrNull(::findExecutable)

        private fun findExecutable(name: String): String? {
            val path = System.getenv("PATH") ?: return null
            return path.split(System.getProperty("path.separator")).asSequence()
                .map { Path.of(it).resolve(name) }
                .firstOrNull { Files.isExecutable(it) }
                ?.absolutePathString()
        }
    }
}
