# RVM

RVM is a planned virtual machine for programs written in the RCompiler `.rx`
language. The primary input is Rx source, not LLVM IR text.

The intended pipeline is:

```text
.rx source
  -> RCompiler frontend, semantic passes, and IR builder
  -> backend.ir.IrModule
  -> RVM interpreter / profiler / JIT
  -> RCompiler RISC-V codegen or simulator handoff
```

This project should reuse RCompiler's existing frontend and `backend.ir`
representation. Avoid building a separate LLVM IR text parser unless it becomes
an optional compatibility path later.

Current status: first simple interpreter implementation. The VM builds `.rx`
through RCompiler into `backend.ir.IrModule`, then executes the module with a
structured-memory interpreter.

Basic commands:

```bash
make build
make test
make run RX=/path/to/program.rx
```
