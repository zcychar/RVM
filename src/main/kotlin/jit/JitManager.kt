package jit

import backend.ir.IrFunction
import backend.ir.IrModule
import interpreter.Memory
import interpreter.RuntimeValue
import java.nio.file.Path
import kotlin.io.path.createDirectories
import kotlin.io.path.exists
import kotlin.io.path.writeText

class JitManager(
    private val module: IrModule,
    private val cacheRoot: Path = Path.of(".rvm-cache"),
    private val toolchain: JitToolchain = JitToolchain.detect(),
) {
    private val functionArtifacts = mutableMapOf<String, FunctionArtifact>()
    private val entryArtifacts = mutableMapOf<String, EntryArtifact>()
    private val closureAnalyzer = JitClosureAnalyzer(module)
    private val functionCompiler = FunctionCompiler(module)
    private val processRunner = JitProcessRunner(cacheRoot, toolchain)

    init {
        cacheRoot.createDirectories()
    }

    fun invoke(function: IrFunction, args: List<RuntimeValue>, memory: Memory): RuntimeValue? {
        if (!toolchain.available) return null
        val entry = ensureEntry(function) ?: return null
        val invocation = JitInvocation.prepare(entry.abi, args, memory) ?: return null
        val output = processRunner.runQemu(entry.executablePath, invocation.input) ?: return null
        return invocation.applyOutput(output)
    }

    private fun ensureEntry(root: IrFunction): EntryArtifact? {
        entryArtifacts[root.name]?.let {
            if (it.executablePath.exists()) return it
        }

        val closure = closureAnalyzer.buildClosure(root) ?: return null
        if (closure.any { !closureAnalyzer.isEligibleFunction(it) }) return null

        val abi = EntryAbi.from(root) ?: return null
        val functionObjects = closure.map { ensureFunctionObject(it) ?: return null }
        val fingerprint = entryFingerprint(root, abi, functionObjects)
        val entryDir = cacheRoot.resolve("entries").resolve("${safeName(root.name)}-$fingerprint")
        val elfPath = entryDir.resolve("root.elf")

        if (elfPath.exists()) {
            return EntryArtifact(abi, elfPath).also { entryArtifacts[root.name] = it }
        }

        entryDir.createDirectories()
        val wrapperAsm = entryDir.resolve("wrapper.s")
        val wrapperObj = entryDir.resolve("wrapper.o")
        wrapperAsm.writeText(WrapperGenerator.generate(abi))
        if (!processRunner.assemble(wrapperAsm, wrapperObj)) return null

        val objects = listOf(wrapperObj) + functionObjects.map { it.objectPath }
        if (!processRunner.link(elfPath, objects)) return null

        entryDir.resolve("meta.txt").writeText(buildString {
            appendLine("root=${root.name}")
            appendLine("fingerprint=$fingerprint")
            appendLine("objects=${functionObjects.joinToString(",") { it.functionName }}")
        })

        return EntryArtifact(abi, elfPath).also { entryArtifacts[root.name] = it }
    }

    private fun ensureFunctionObject(function: IrFunction): FunctionArtifact? {
        val fingerprint = hashString(function.render())
        val key = "${function.name}:$fingerprint"
        functionArtifacts[key]?.let {
            if (it.objectPath.exists()) return it
        }

        val dir = cacheRoot.resolve("functions").resolve("${safeName(function.name)}-$fingerprint")
        val asmPath = dir.resolve("function.s")
        val objectPath = dir.resolve("function.o")
        if (objectPath.exists()) {
            return FunctionArtifact(function.name, fingerprint, objectPath)
                .also { functionArtifacts[key] = it }
        }

        dir.createDirectories()
        asmPath.writeText(functionCompiler.compile(function))
        if (!processRunner.assemble(asmPath, objectPath)) return null

        dir.resolve("meta.txt").writeText(buildString {
            appendLine("function=${function.name}")
            appendLine("fingerprint=$fingerprint")
            appendLine("callees=${closureAnalyzer.directUserCallees(function).joinToString(",")}")
        })

        return FunctionArtifact(function.name, fingerprint, objectPath)
            .also { functionArtifacts[key] = it }
    }

    private fun entryFingerprint(
        root: IrFunction,
        abi: EntryAbi,
        functionObjects: List<FunctionArtifact>,
    ): String = hashString(buildString {
        append(root.name).append('\n')
        append(abi.render()).append('\n')
        functionObjects.sortedBy { it.functionName }.forEach {
            append(it.functionName).append(':').append(it.fingerprint).append('\n')
        }
    })
}
