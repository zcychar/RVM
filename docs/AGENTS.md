# Repository Guidelines

## Project Structure & Module Organization

This repository is the RVM planning workspace. The project goal is an Rx-input virtual machine that reuses `~/RCompiler` for parsing, semantic analysis, and construction of `backend.ir.IrModule`. RVM should execute and later JIT that IR; it should not build an independent Rx or LLVM IR frontend on the primary path.

- `docs/`: design notes and current implementation plan.
- `benchmarks/rcompiler-ir1-unopt/`: legacy LLVM IR snapshots, inputs, and expected output kept as reference data.
- Future `src/bridge/`: calls into RCompiler and obtains `IrModule` from `.rx`.
- Future `src/interpreter/`: stack frames, memory model, builtins, and control flow.
- Future `src/jit/`: profiling, hot-function selection, code generation bridge, code cache, and runtime handoff.
- Future `tests/`: Rx integration tests plus focused interpreter and JIT tests.

Keep the VM core centered on `backend.ir.*`; add adapter metadata only when RCompiler IR cannot represent runtime details directly.

## Build, Test, and Development Commands

No build system exists yet. Add one before substantial code and document the commands here and in `README.md`. Prefer simple Gradle or Make entry points such as:

- `make build`: compile the VM.
- `make test`: run all unit and integration tests.
- `make run RX=fixtures/simple.rx`: execute one Rx source file through RCompiler.
- `make fmt`: apply project formatting.

Until these exist, contributors should not assume any command is supported.

## Coding Style & Naming Conventions

Use Kotlin/JVM or Java in the same style as RCompiler. Keep modules small and named by VM responsibility: `RCompilerBridge`, `Machine`, `Frame`, `Memory`, `BuiltinRegistry`, `Profiler`, and `JitCompiler`. Prefer explicit memory and layout APIs over pointer arithmetic spread across instruction handlers.

## Testing Guidelines

Tests should be driven by `.rx` programs accepted by `~/RCompiler`. Start with bridge tests that prove `.rx -> IrModule`, then interpreter behavior tests, then JIT-vs-interpreter equivalence tests. Name fixtures descriptively, for example `fixtures/control_flow/while_sum.rx` or `fixtures/aggregate/struct_return.rx`. Keep legacy `.ll` benchmarks as reference only unless an explicit LLVM compatibility path is added.

## Commit & Pull Request Guidelines

The current history has no established convention beyond `first commit`. Use short imperative commit messages with a scoped prefix, such as `bridge: expose RCompiler module generation` or `interpreter: implement call frames`. Pull requests should describe supported Rx/IR behavior, list tests run, link related issues, and include sample input/output when behavior changes.

## Agent-Specific Instructions

Before implementing VM behavior, inspect `~/RCompiler` APIs and reuse existing frontend, semantic passes, and `backend.ir` classes. Treat DarkSwordVM as architectural reference, not a source to copy directly. Do not reintroduce ANTLR or LLVM IR parsing as the main path without explicit direction.
