package rvm

import bridge.RCompilerBridge
import interpreter.Machine
import java.nio.file.Path
import kotlin.system.exitProcess

fun main(args: Array<String>) {
    if (args.size != 1) {
        System.err.println("usage: rvm <file.rx>")
        exitProcess(2)
    }

    val module = RCompilerBridge.buildModuleFromFile(Path.of(args[0]), optimize = false)
    val exitCode = Machine(module, System.`in`, System.out).runMain()
    exitProcess(exitCode)
}

