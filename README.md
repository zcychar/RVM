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

Current status: interpreter, profiler, and method-based QEMU JIT. The
VM builds `.rx` through RCompiler into `backend.ir.IrModule`, executes through a
structured-memory interpreter, and can compile hot closed call graphs to
function-level RISC-V objects plus a QEMU entry ELF. The JIT uses profiler
block-edge counts to lay out hot basic-block paths as fallthroughs before code
generation.

The JIT cache is function/object based:

```text
.rvm-cache/functions/<function-fingerprint>/function.s
.rvm-cache/functions/<function-fingerprint>/function.o
.rvm-cache/entries/<root-fingerprint>/wrapper.s
.rvm-cache/entries/<root-fingerprint>/wrapper.o
.rvm-cache/entries/<root-fingerprint>/root.elf
```

Pointer arguments are passed through a wrapper protocol that copies the full
pointee region into a guest arena before the call and copies the full arena back
after QEMU returns.

Basic commands:

```bash
make build
make test
make run RX=/path/to/program.rx
```

Docker JIT environment:

```bash
make docker-build
make docker-shell
```

Inside the container:

```bash
./gradlew run --args="--jit benchmarks/rvm-rx/hot_scalar_loop.rx"
./gradlew run --args="--no-jit benchmarks/rvm-rx/hot_scalar_loop.rx"
```

Or run directly through Docker without entering a shell:

```bash
make docker-run RX="--jit benchmarks/rvm-rx/hot_scalar_loop.rx"
make docker-test
```
