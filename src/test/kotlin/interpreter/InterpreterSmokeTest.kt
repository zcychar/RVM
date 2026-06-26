package interpreter

import bridge.RCompilerBridge
import java.io.ByteArrayInputStream
import java.nio.file.Files
import java.nio.file.Path
import kotlin.test.Test
import kotlin.test.assertEquals

class InterpreterSmokeTest {
    @Test
    fun runsSimpleProgram() {
        val source = """
            fn main() {
                let a: i32 = 40;
                let b: i32 = 2;
                printlnInt(a + b);
                exit(0);
            }
        """.trimIndent()
        val output = StringBuilder()
        val module = RCompilerBridge.buildModuleFromSource(source)
        val exitCode = Machine(module, ByteArrayInputStream(ByteArray(0)), output).runMain()

        assertEquals(0, exitCode)
        assertEquals("42\n", output.toString())
    }

    @Test
    fun runsIr1ComprehensiveBenchmarks() {
        val sourceRoot = Path.of("../src/main/resources/RCompiler-Testcases/IR-1/src")
        if (!Files.isDirectory(sourceRoot)) return

        for (n in 1..50) {
            val case = "comprehensive$n"
            System.err.println("running $case")
            val source = sourceRoot.resolve("$case/$case.rx")
            val input = Files.readString(Path.of("benchmarks/rcompiler-ir1-unopt/input/$case.in"))
            val expected = Files.readString(Path.of("benchmarks/rcompiler-ir1-unopt/expected/$case.out"))
            val output = StringBuilder()

            val module = RCompilerBridge.buildModuleFromFile(source)
            val exitCode = Machine(module, ByteArrayInputStream(input.toByteArray()), output).runMain()

            assertEquals(0, exitCode, "$case exit code")
            assertEquals(expected.trimFinalNewline(), output.toString().trimFinalNewline(), "$case stdout")
        }
    }
}

private fun String.trimFinalNewline(): String =
    removeSuffix("\n").removeSuffix("\r")
