package rvm

import bridge.RCompilerBridge
import interpreter.Machine
import jit.JitManager
import profiler.Profiler
import java.nio.file.Path
import kotlin.system.exitProcess

fun main(args: Array<String>) {
    val options = CliOptions.parse(args) ?: run {
        System.err.println("usage: rvm [--no-jit|--jit] [--jit-threshold=N] <file.rx>")
        exitProcess(2)
    }

    val module = RCompilerBridge.buildModuleFromFile(options.input, optimize = false)
    val profiler = Profiler(
        callThreshold = options.jitThreshold,
        instructionThreshold = Long.MAX_VALUE,
        backEdgeThreshold = Long.MAX_VALUE,
    )
    val jitManager = if (options.jitEnabled) JitManager(module, profiler = profiler) else null
    val exitCode = Machine(module, System.`in`, System.out, profiler, jitManager).runMain()
    exitProcess(exitCode)
}

private data class CliOptions(
    val input: Path,
    val jitEnabled: Boolean,
    val jitThreshold: Long,
) {
    companion object {
        fun parse(args: Array<String>): CliOptions? {
            var jitEnabled = true
            var jitThreshold = 1_000L
            var input: Path? = null

            for (arg in args) {
                when {
                    arg == "--no-jit" -> jitEnabled = false
                    arg == "--jit" -> jitEnabled = true
                    arg.startsWith("--jit-threshold=") -> {
                        jitThreshold = arg.substringAfter('=').toLongOrNull() ?: return null
                        if (jitThreshold <= 0) return null
                    }
                    arg.startsWith("--") -> return null
                    input == null -> input = Path.of(arg)
                    else -> return null
                }
            }

            return CliOptions(input ?: return null, jitEnabled, jitThreshold)
        }
    }
}
