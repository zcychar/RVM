package jit

import java.nio.file.Path
import java.util.concurrent.CompletableFuture
import java.util.concurrent.TimeUnit
import kotlin.io.path.absolutePathString
import kotlin.io.path.writeBytes

internal class JitProcessRunner(
    private val cacheRoot: Path,
    private val toolchain: JitToolchain,
) {
    fun assemble(sourcePath: Path, objectPath: Path): Boolean =
        runCommand(
            listOf(
                toolchain.assembler,
                "-march=rv64im",
                "-mabi=lp64",
                sourcePath.absolutePathString(),
                "-o",
                objectPath.absolutePathString(),
            ),
        )

    fun link(executablePath: Path, objectPaths: List<Path>): Boolean =
        runCommand(
            buildList {
                add(toolchain.linker)
                add("-static")
                add("-o")
                add(executablePath.absolutePathString())
                objectPaths.forEach { add(it.absolutePathString()) }
            },
        )

    fun runQemu(executable: Path, input: ByteArray): ByteArray? {
        val process = ProcessBuilder(toolchain.qemu, executable.absolutePathString()).start()
        val stdoutFuture = CompletableFuture.supplyAsync { process.inputStream.readBytes() }
        val stderrFuture = CompletableFuture.supplyAsync { process.errorStream.readBytes() }
        process.outputStream.use { it.write(input) }
        if (!process.waitFor(30, TimeUnit.SECONDS)) {
            process.destroyForcibly()
            return null
        }
        val exitCode = process.exitValue()
        val stdout = stdoutFuture.get(5, TimeUnit.SECONDS)
        val stderr = stderrFuture.get(5, TimeUnit.SECONDS)
        if (exitCode != 0) {
            if (stderr.isNotEmpty()) {
                cacheRoot.resolve("last-qemu.err").writeBytes(stderr)
            }
            return null
        }
        return stdout
    }

    private fun runCommand(command: List<String>): Boolean {
        val process = ProcessBuilder(command).redirectErrorStream(true).start()
        val output = process.inputStream.readBytes()
        val exitCode = process.waitFor()
        if (exitCode != 0) {
            cacheRoot.resolve("last-tool.err").writeBytes(output)
            return false
        }
        return true
    }
}
