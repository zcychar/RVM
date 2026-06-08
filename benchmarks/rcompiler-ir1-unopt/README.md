# RCompiler IR-1 Unoptimized Benchmark Reference

This directory keeps the previous LLVM-style IR benchmark snapshot for
reference. RVM's primary input is now `.rx` source through RCompiler, so these
files are not the main implementation target.

## Layout

- `ll/`: generated LLVM-style IR files.
- `input/`: testcase stdin files copied from RCompiler.
- `expected/`: expected stdout files copied from RCompiler.

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

Inputs and expected outputs were copied from the same testcase directories.

## Baseline Facts

- IR files: 50
- Total IR lines: 116592
- Source mode: `--emit=ir --no-opt`
- Intended use: reference output and IR-shape inspection while the VM is
  migrated to Rx input.
