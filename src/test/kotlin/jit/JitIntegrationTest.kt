package jit

import bridge.RCompilerBridge
import interpreter.Machine
import profiler.Profiler
import java.io.ByteArrayInputStream
import java.nio.file.Files
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class JitIntegrationTest {
    @Test
    fun runsClosedCallGraphThroughQemu() {
        if (!JitToolchain.detect().available) return

        val source = """
            fn add1(x: i32) -> i32 {
                return x + 1;
            }

            fn add2(x: i32) -> i32 {
                return add1(x) + 1;
            }

            fn main() {
                let mut i: i32 = 0;
                let mut sum: i32 = 0;
                while (i < 3) {
                    sum = sum + add2(i);
                    i = i + 1;
                }
                printlnInt(sum);
                exit(0);
            }
        """.trimIndent()

        val module = RCompilerBridge.buildModuleFromSource(source)
        val cache = Files.createTempDirectory("rvm-jit-closure")
        val profiler = Profiler(callThreshold = 1, instructionThreshold = 1_000_000, backEdgeThreshold = 1_000_000)
        val output = StringBuilder()
        val exitCode = Machine(
            module,
            ByteArrayInputStream(ByteArray(0)),
            output,
            profiler,
            JitManager(module, cache),
        ).runMain()

        assertEquals(0, exitCode)
        assertEquals("9\n", output.toString())
        assertTrue(Files.walk(cache.resolve("functions")).use { stream -> stream.anyMatch { it.fileName.toString() == "function.o" } })
        assertTrue(Files.walk(cache.resolve("entries")).use { stream -> stream.anyMatch { it.fileName.toString() == "root.elf" } })
    }

    @Test
    fun copiesPointerArgumentsBackToInterpreterMemory() {
        if (!JitToolchain.detect().available) return

        val source = """
            fn add_to(x: &mut i32, y: i32) {
                *x = *x + y;
            }

            fn bump_twice(x: &mut i32) {
                add_to(x, 2);
                add_to(x, 3);
            }

            fn main() {
                let mut value: i32 = 5;
                bump_twice(&mut value);
                printlnInt(value);
                exit(0);
            }
        """.trimIndent()

        val module = RCompilerBridge.buildModuleFromSource(source)
        val cache = Files.createTempDirectory("rvm-jit-pointer")
        val profiler = Profiler(callThreshold = 1, instructionThreshold = 1_000_000, backEdgeThreshold = 1_000_000)
        val output = StringBuilder()
        val exitCode = Machine(
            module,
            ByteArrayInputStream(ByteArray(0)),
            output,
            profiler,
            JitManager(module, cache),
        ).runMain()

        assertEquals(0, exitCode)
        assertEquals("10\n", output.toString())
        assertTrue(Files.walk(cache.resolve("entries")).use { stream -> stream.anyMatch { it.fileName.toString() == "root.elf" } })
    }
}
