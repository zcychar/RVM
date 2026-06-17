# RVM Runtime Definitions and Interfaces

This document describes the RVM runtime built around RCompiler
`backend.ir.IrModule`: bridge, interpreter, profiler, memory model, and the
QEMU-backed JIT path. RVM executes RCompiler IR directly and does not parse LLVM
IR text on the primary path.

## Pipeline

The only supported input path is:

```text
.rx source
  -> RCompiler frontend and semantic passes
  -> IrBackend.buildModule(..., optimize = false)
  -> interpreter.Machine.runMain()
  -> profiler-guided JIT for hot closed user-call graphs
```

`RCompilerBridge` owns the `.rx -> IrModule` step. `Machine` owns execution,
records profiling data, and delegates hot eligible function calls to
`JitManager`.

## Build and Run Interfaces

`build.gradle.kts` defines a minimal Kotlin/JVM application. RVM reuses
RCompiler source directly by adding `../src/main/kotlin` to the main source set.

Useful commands:

```bash
make build
make test
make run RX=/path/to/program.rx
```

The CLI entry point is `rvm.MainKt`. It accepts one `.rx` file path, builds an
unoptimized `IrModule`, creates a `Profiler` and `JitManager`, executes `main`,
and exits with the program exit code.

## Bridge

File: `src/main/kotlin/bridge/RCompilerBridge.kt`

```kotlin
object RCompilerBridge {
    fun buildModuleFromFile(path: Path, optimize: Boolean = false): IrModule
    fun buildModuleFromSource(source: String, optimize: Boolean = false): IrModule
}
```

The bridge follows RCompiler `Main.kt`:

1. `RPreprocessor`
2. `RLexer`
3. `RParser`
4. `toPrelude`
5. `RSymbolCollector`
6. `RSymbolResolver`
7. `RImplInjector`
8. `RSemanticChecker`
9. `IrBackend.buildModule`

The runtime tests use `optimize = false`.

## Runtime Values

File: `src/main/kotlin/interpreter/RuntimeValue.kt`

```kotlin
sealed interface RuntimeValue
data class IntValue(val value: Long) : RuntimeValue
data class PointerValue(val objectId: Int, val path: List<Int>, val pointeeType: IrType) : RuntimeValue
data object UnitValue : RuntimeValue
```

`IntValue` represents integers and booleans. Booleans use `0` and `1`.

`PointerValue` represents a pointer into structured memory:

- `objectId`: allocated object id.
- `path`: aggregate field or element path inside the object.
- `pointeeType`: IR type at the pointed location.

`UnitValue` represents void-like results and missing aggregate scalar values.

## Memory

File: `src/main/kotlin/interpreter/Memory.kt`

Memory is structured, not byte-addressed. Each `alloca T` creates one memory
object with root type `T`. Values are stored in a map keyed by `path`.

```kotlin
class Memory {
    fun allocate(type: IrType): PointerValue
    fun load(pointer: PointerValue, type: IrType): RuntimeValue
    fun store(pointer: PointerValue, value: RuntimeValue)
    fun copy(dest: PointerValue, src: PointerValue)
    fun bitcast(pointer: PointerValue, type: IrType): PointerValue
    fun toBytes(pointer: PointerValue, type: IrType = pointer.pointeeType): ByteArray
    fun writeBytes(pointer: PointerValue, bytes: ByteArray, type: IrType = pointer.pointeeType)
}
```

Examples:

- `alloca i32` returns `PointerValue(id, [], i32)`.
- `gep arrayPtr, 0, i` returns `PointerValue(id, [i], elementType)`.
- `gep structPtr, 0, field` returns `PointerValue(id, [field], fieldType)`.
- `llvm.memcpy.p0.p0.i32` calls `Memory.copy`.
- JIT pointer marshalling uses `toBytes` and `writeBytes` with RCompiler
  `typeLayout`/`typeSize`.

Unwritten primitive slots read as zero.

## Frames

File: `src/main/kotlin/interpreter/Frame.kt`

Each interpreted function call gets one `Frame`.

```kotlin
class Frame(
    val function: IrFunction,
    val args: List<RuntimeValue>,
)
```

Frame state:

- `locals`: SSA/local value table keyed by IR local name.
- `blocks`: function block lookup by label.
- `currentBlock`: block currently being executed.
- `predecessor`: previous block label used by phi instructions.

Function parameters are bound into `locals` from `function.parameterNames`, and
`IrParameter` values can also read directly from `args[index]`.

## Machine

File: `src/main/kotlin/interpreter/Machine.kt`

```kotlin
class Machine(
    module: IrModule,
    input: InputStream,
    output: Appendable,
    profiler: Profiler? = null,
    jitManager: JitManager? = null,
) {
    fun runMain(): Int
}
```

`Machine` builds a function table from `module.declaredFunctions()`, finds
`main`, and interprets calls recursively. At each function call it records the
call in `Profiler`; if the function is hot and `JitManager` can compile and run
that call, the JIT result is used. Otherwise execution stays in the interpreter.
`exit(code)` is implemented as an internal control exception that stops
execution and returns `code`.

## JIT

File: `src/main/kotlin/jit/JitManager.kt`

`JitManager` compiles hot functions by reusing RCompiler's RISC-V backend:

1. Build the closed user-call graph rooted at the hot function.
2. Reject roots whose closure contains unsupported external calls, global
   references, function values used as data, or unmarshalable signatures.
3. Emit each function as its own assembly/object cache entry.
4. Generate a wrapper `_start` that reads arguments and pointer arena from
   stdin, calls the root function, and writes return value plus arena to stdout.
5. Link wrapper object and closure function objects into `root.elf`.
6. Execute `root.elf` with `qemu-riscv64`.

Compiled code does not call back into the interpreter. If a function cannot be
compiled, the interpreter remains the execution path for that call.

JIT cache layout:

```text
.rvm-cache/functions/<function-fingerprint>/function.s
.rvm-cache/functions/<function-fingerprint>/function.o
.rvm-cache/entries/<root-fingerprint>/wrapper.s
.rvm-cache/entries/<root-fingerprint>/wrapper.o
.rvm-cache/entries/<root-fingerprint>/root.elf
```

Pointer arguments are copied by value across the QEMU boundary. The wrapper
receives an arena containing each marshalable pointee region, passes guest
addresses into the compiled function, then returns the full arena so RVM can
write modified regions back into `Memory`.

## Supported Interpreted IR

The interpreter supports the IR instructions needed by the IR-1 comprehensive
benchmarks:

- `IrConst`
- `IrAlloca`
- `IrLoad`
- `IrStore`
- `IrBinary`
- `IrUnary`
- `IrCmp`
- `IrCast`
- `IrGep`
- `IrPhi`
- `IrCall`
- `IrReturn`
- `IrBranch`
- `IrJump`

Supported builtins:

- `getInt.`
- `printInt.`
- `printlnInt.`
- `exit.`
- `llvm.memcpy.p0.p0.i32`

Unsupported calls fail immediately with `unknown function`.

## Aggregate Rule

Aggregates (`IrArray`, `IrStruct`) live in `Memory`; SSA locals hold pointers to
them. This matches RCompiler lowering:

- aggregate parameters are pointer parameters,
- aggregate returns use `sret`,
- aggregate copies become field-wise `gep/load/store` or `llvm.memcpy`.

No special aggregate value object exists. This keeps arrays, structs, nested
aggregates, and `sret` on one pointer path model.

## Tests

File: `src/test/kotlin/interpreter/InterpreterSmokeTest.kt`

Tests include:

- a small source-level smoke test,
- all 50 IR-1 comprehensive benchmark programs, comparing stdout and exit code.

The expected benchmark files omit a final newline in some cases, while
`printlnInt` naturally emits one. The test comparison ignores only one final
line break and still compares the full output content.
