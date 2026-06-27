# RVM

RVM runs RCompiler `.rx` programs through an interpreter, profiler, and optional
RISC-V/QEMU JIT. The primary input is `.rx` source.

Pipeline:

```text
.rx source
  -> RCompiler frontend
  -> backend.ir.IrModule
  -> RVM interpreter / profiler / JIT
```

## Requirements

- JDK 24
- Docker + Colima for JIT runs on macOS

## Basic Usage

Show available commands:

```bash
make
```

Build and test locally:

```bash
make build
make test
```

Run with the interpreter:

```bash
make run RX="--no-jit benchmarks/rvm-rx/hot_scalar_loop.rx"
```

## JIT With Docker

Start Docker if needed:

```bash
colima start
```

Build the reusable JIT image:

```bash
make docker-build
```

Run with JIT:

```bash
make docker-run RX="--jit benchmarks/rvm-rx/hot_scalar_loop.rx"
```

Open a shell in the JIT container:

```bash
make docker-shell
```

Run tests in the JIT container:

```bash
make docker-test
```

JIT artifacts are cached under `.rvm-cache/`.
