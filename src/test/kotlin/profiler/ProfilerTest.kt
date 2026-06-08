package profiler

import bridge.RCompilerBridge
import interpreter.Machine
import java.io.ByteArrayInputStream
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

class ProfilerTest {
    @Test
    fun recordsMethodCountersAndHotMethods() {
        val source = """
            fn inc(x: i32) -> i32 {
                return x + 1;
            }

            fn main() {
                let mut i: i32 = 0;
                let mut sum: i32 = 0;
                while (i < 3) {
                    sum = sum + inc(i);
                    i = i + 1;
                }
                printlnInt(sum);
                exit(0);
            }
        """.trimIndent()

        val profiler = Profiler(callThreshold = 2, instructionThreshold = 1_000, backEdgeThreshold = 1)
        val output = StringBuilder()
        val module = RCompilerBridge.buildModuleFromSource(source)
        val incName = module.declaredFunctions().single { it.name != "main" }.name
        val exitCode = Machine(module, ByteArrayInputStream(ByteArray(0)), output, profiler).runMain()

        assertEquals(0, exitCode)
        assertEquals("6\n", output.toString())

        val main = assertNotNull(profiler.profile("main"))
        val inc = assertNotNull(profiler.profile(incName))

        assertEquals(1, main.calls)
        assertEquals(3, inc.calls)
        assertTrue(main.instructions > 0)
        assertTrue(inc.instructions > 0)
        assertTrue(main.backEdges > 0)
        assertTrue(main.hot)
        assertTrue(inc.hot)
        assertEquals(listOf("main", incName), profiler.hotMethods().map { it.name })
    }
}
