# RCompiler IR-1 Unoptimized Benchmark Reference

This directory keeps the previous LLVM-style IR benchmark snapshot for
reference. RVM's primary input is now `.rx` source through RCompiler.

The matching runnable sources are mirrored in this repository:

```text
benchmarks/rcompiler-testcases/semantic-2/comprehensive*/comprehensive*.rx
```

Those files were copied from the parent RCompiler checkout's
`RCompiler-Testcases` submodule. To refresh the mirror, update the parent
submodule and copy it into `benchmarks/rcompiler-testcases/`.

```bash
git submodule update --init --remote src/main/resources/RCompiler-Testcases
```

## Layout

- `ll/`: generated LLVM-style IR files.
- `input/`: testcase stdin files copied from the old IR-1 dataset.
- `expected/`: expected stdout files copied from the old IR-1 dataset.

The benchmark driver uses the mirrored `semantic-2` `.rx/.in/.out` files
directly for interpreter/JIT timing and keeps this directory as an IR-shape
reference.

## Generation

The files were generated from `/home/zcychar/RCompiler` with optimization
disabled:

```bash
for n in $(seq 1 50); do
  case="comprehensive${n}"
  src="src/main/resources/RCompiler-Testcases/IR-1/src/${case}/${case}.rx"
  java -XX:+PerfDisableSharedMem \
    -jar RCompiler-1.0-SNAPSHOT-all.jar \
    "$src" --emit=ir --no-opt \
    -o "benchmarks/rcompiler-ir1-unopt/ll/${case}.ll"
done
```

Inputs and expected outputs were copied from the same testcase directories. The
current benchmark source path is `semantic-2`, because the upstream submodule no
longer checks out `IR-1/src/...` source files; `IR-1` now contains only testcase
metadata.

## Baseline Facts

- IR files: 50
- Total IR lines: 116592
- Source mode: `--emit=ir --no-opt`
- Intended use: reference output and IR-shape inspection while the VM is
  migrated to Rx input.
