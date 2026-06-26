package bridge

import backend.ir.IrBackend
import backend.ir.IrModule
import frontend.RLexer
import frontend.RParser
import frontend.RPreprocessor
import frontend.ast.CrateNode
import frontend.semantic.*
import java.nio.file.Files
import java.nio.file.Path

object RCompilerBridge {
    fun buildModuleFromFile(path: Path, optimize: Boolean = false): IrModule =
        buildModuleFromSource(Files.readString(path), optimize)

    fun buildModuleFromSource(source: String, optimize: Boolean = false): IrModule {
        val processed = RPreprocessor(source).process()
        val tokens = RLexer(processed).process()
        val crate = RParser(tokens).process()

        val prelude = toPrelude()
        RSymbolCollector(prelude, crate).process()
        RSymbolResolver(prelude, crate).process()
        RImplInjector(prelude, crate).process()
        RSemanticChecker(prelude, crate).process()

        return IrBackend(enableOptimization = optimize).buildModuleReflectively(crate, prelude)
    }

    private fun IrBackend.buildModuleReflectively(crate: CrateNode, globalScope: Scope): IrModule {
        val method = javaClass.getDeclaredMethod("buildModule", CrateNode::class.java, Scope::class.java)
        method.isAccessible = true
        return method.invoke(this, crate, globalScope) as IrModule
    }
}
