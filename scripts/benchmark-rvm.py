#!/usr/bin/env python3
"""Benchmark RVM interpreter vs JIT on .rx programs."""

from __future__ import annotations

import argparse
import csv
import math
import shutil
import statistics
import subprocess
import sys
import time
from dataclasses import dataclass
from pathlib import Path


@dataclass(frozen=True)
class Benchmark:
    name: str
    source: Path
    stdin: Path | None
    expected: Path | None
    group: str


@dataclass
class RunResult:
    returncode: int
    stdout: str
    stderr: str
    elapsed_ms: float
    timed_out: bool = False


@dataclass
class Stats:
    min_ms: float | None = None
    median_ms: float | None = None
    mean_ms: float | None = None


def parse_args() -> argparse.Namespace:
    repo = Path(__file__).resolve().parents[1]
    default_rvm = repo / "build" / "install" / "rvm" / "bin" / "rvm"
    default_comprehensive = repo / "benchmarks" / "rcompiler-testcases" / "semantic-2"

    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rvm", type=Path, default=default_rvm)
    parser.add_argument("--results-dir", type=Path, default=repo / "benchmarks" / "results")
    parser.add_argument("--iterations", type=int, default=5)
    parser.add_argument("--jit-threshold", type=int, default=1)
    parser.add_argument("--timeout", type=float, default=60.0)
    parser.add_argument("--comprehensive-root", type=Path, default=default_comprehensive)
    parser.add_argument("--comprehensive-range", default="1:50")
    parser.add_argument("--suite-file", type=Path)
    parser.add_argument("--discover", action="store_true")
    parser.add_argument("--no-rvm-rx", action="store_true")
    parser.add_argument("--no-comprehensive", action="store_true")
    parser.add_argument("--require-jit-artifacts", action="store_true")
    parser.add_argument("--keep-cache", action="store_true")
    return parser.parse_args()


def parse_range(value: str) -> list[int]:
    if not value:
        return []
    numbers: list[int] = []
    for part in value.split(","):
        part = part.strip()
        if not part:
            continue
        if ":" in part:
            start_s, end_s = part.split(":", 1)
            start = int(start_s)
            end = int(end_s)
            if start > end:
                raise ValueError(f"invalid range: {part}")
            numbers.extend(range(start, end + 1))
        else:
            numbers.append(int(part))
    return numbers


def discover_benchmarks(args: argparse.Namespace) -> list[Benchmark]:
    repo = Path(__file__).resolve().parents[1]
    benchmarks: list[Benchmark] = []

    if not args.no_rvm_rx:
        for source in sorted((repo / "benchmarks" / "rvm-rx").glob("*.rx")):
            benchmarks.append(Benchmark(source.stem, source, None, None, "rvm-rx"))

    if not args.no_comprehensive and args.comprehensive_root.is_dir():
        for n in parse_range(args.comprehensive_range):
            case = f"comprehensive{n}"
            case_dir = args.comprehensive_root / case
            source = case_dir / f"{case}.rx"
            stdin = case_dir / f"{case}.in"
            expected = case_dir / f"{case}.out"
            if source.is_file():
                benchmarks.append(
                    Benchmark(
                        name=f"semantic-2/{case}",
                        source=source,
                        stdin=stdin if stdin.is_file() else None,
                        expected=expected if expected.is_file() else None,
                        group="semantic-2",
                    )
                )

    return benchmarks


def load_suite_file(path: Path) -> list[Benchmark]:
    repo = Path(__file__).resolve().parents[1]
    benchmarks: list[Benchmark] = []
    for line_no, raw_line in enumerate(path.read_text().splitlines(), start=1):
        line = raw_line.split("#", 1)[0].strip()
        if not line:
            continue
        parts = [part.strip() for part in line.split(",")]
        if len(parts) not in (2, 4):
            raise ValueError(f"{path}:{line_no}: expected name,source[,stdin,expected]")

        name = parts[0]
        source = resolve_suite_path(repo, parts[1])
        stdin = resolve_suite_path(repo, parts[2]) if len(parts) == 4 and parts[2] else None
        expected = resolve_suite_path(repo, parts[3]) if len(parts) == 4 and parts[3] else None
        if not source.is_file():
            raise ValueError(f"{path}:{line_no}: source not found: {source}")
        if stdin is not None and not stdin.is_file():
            raise ValueError(f"{path}:{line_no}: stdin not found: {stdin}")
        if expected is not None and not expected.is_file():
            raise ValueError(f"{path}:{line_no}: expected not found: {expected}")
        group = name.split("/", 1)[0] if "/" in name else "suite"
        benchmarks.append(Benchmark(name, source, stdin, expected, group))
    return benchmarks


def resolve_suite_path(repo: Path, value: str) -> Path:
    path = Path(value)
    return path if path.is_absolute() else repo / path


def run_once(
    rvm: Path,
    args: list[str],
    benchmark: Benchmark,
    cwd: Path,
    timeout: float,
) -> RunResult:
    stdin_data = benchmark.stdin.read_bytes() if benchmark.stdin else None
    start = time.perf_counter()
    try:
        completed = subprocess.run(
            [str(rvm), *args, str(benchmark.source)],
            input=stdin_data,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            cwd=cwd,
            timeout=timeout,
            check=False,
        )
        elapsed_ms = (time.perf_counter() - start) * 1000.0
        return RunResult(
            returncode=completed.returncode,
            stdout=completed.stdout.decode("utf-8", errors="replace"),
            stderr=completed.stderr.decode("utf-8", errors="replace"),
            elapsed_ms=elapsed_ms,
        )
    except subprocess.TimeoutExpired as exc:
        elapsed_ms = (time.perf_counter() - start) * 1000.0
        stdout = (exc.stdout or b"").decode("utf-8", errors="replace")
        stderr = (exc.stderr or b"").decode("utf-8", errors="replace")
        return RunResult(124, stdout, stderr, elapsed_ms, timed_out=True)


def stat(values: list[float]) -> Stats:
    if not values:
        return Stats()
    return Stats(
        min_ms=min(values),
        median_ms=statistics.median(values),
        mean_ms=statistics.fmean(values),
    )


def artifact_count(work_dir: Path) -> int:
    cache = work_dir / ".rvm-cache"
    if not cache.exists():
        return 0
    roots = [cache / "functions", cache / "entries"]
    return sum(1 for root in roots if root.exists() for path in root.rglob("*") if path.is_file())


def write_log(log_dir: Path, benchmark: Benchmark, label: str, result: RunResult) -> None:
    safe_name = benchmark.name.replace("/", "__")
    prefix = log_dir / f"{safe_name}.{label}"
    Path(f"{prefix}.stdout").write_text(result.stdout)
    Path(f"{prefix}.stderr").write_text(result.stderr)


def same_output(actual: str, expected: str) -> bool:
    return actual == expected


def fmt(value: float | None) -> str:
    if value is None or math.isnan(value):
        return ""
    return f"{value:.3f}"


def speedup(base: float | None, candidate: float | None) -> float | None:
    if base is None or candidate is None or candidate <= 0:
        return None
    return base / candidate


def run_benchmark(args: argparse.Namespace, benchmark: Benchmark) -> dict[str, object]:
    safe_name = benchmark.name.replace("/", "__")
    work_dir = args.results_dir / "work" / safe_name
    log_dir = args.results_dir / "logs"
    work_dir.mkdir(parents=True, exist_ok=True)
    log_dir.mkdir(parents=True, exist_ok=True)
    if not args.keep_cache:
        shutil.rmtree(work_dir / ".rvm-cache", ignore_errors=True)

    interpreter_check = run_once(args.rvm, ["--no-jit"], benchmark, work_dir, args.timeout)
    write_log(log_dir, benchmark, "check.interpreter", interpreter_check)
    jit_check = run_once(
        args.rvm,
        ["--jit", f"--jit-threshold={args.jit_threshold}"],
        benchmark,
        work_dir,
        args.timeout,
    )
    write_log(log_dir, benchmark, "check.jit", jit_check)

    expected_output = benchmark.expected.read_text() if benchmark.expected else interpreter_check.stdout
    status = "ok"
    notes: list[str] = []
    if interpreter_check.returncode != 0 or interpreter_check.timed_out:
        status = "failed"
        notes.append("interpreter_failed")
    elif not same_output(interpreter_check.stdout, expected_output):
        status = "failed"
        notes.append("expected_mismatch")
    elif jit_check.returncode != 0 or jit_check.timed_out:
        status = "failed"
        notes.append("jit_failed")
    elif not same_output(jit_check.stdout, interpreter_check.stdout):
        status = "failed"
        notes.append("jit_output_mismatch")

    artifacts_after_check = artifact_count(work_dir)
    if artifacts_after_check == 0:
        notes.append("jit_artifact_missing")
        if args.require_jit_artifacts and status == "ok":
            status = "failed"
        elif status == "ok":
            status = "skipped"

    interpreter_times: list[float] = []
    jit_cold_times: list[float] = []
    jit_warm_times: list[float] = []

    if status == "ok":
        for i in range(args.iterations):
            result = run_once(args.rvm, ["--no-jit"], benchmark, work_dir, args.timeout)
            write_log(log_dir, benchmark, f"timed.interpreter.{i + 1}", result)
            if result.returncode == 0 and not result.timed_out and same_output(result.stdout, interpreter_check.stdout):
                interpreter_times.append(result.elapsed_ms)
            else:
                status = "failed"
                notes.append(f"interpreter_timed_run_{i + 1}_failed")
                break

    if status == "ok":
        shutil.rmtree(work_dir / ".rvm-cache", ignore_errors=True)
        for i in range(args.iterations):
            before = artifact_count(work_dir)
            result = run_once(
                args.rvm,
                ["--jit", f"--jit-threshold={args.jit_threshold}"],
                benchmark,
                work_dir,
                args.timeout,
            )
            write_log(log_dir, benchmark, f"timed.jit_cold.{i + 1}", result)
            after = artifact_count(work_dir)
            if result.returncode == 0 and not result.timed_out and same_output(result.stdout, interpreter_check.stdout):
                jit_cold_times.append(result.elapsed_ms)
            else:
                status = "failed"
                notes.append(f"jit_cold_run_{i + 1}_failed")
                break
            if after == 0 or after < before:
                notes.append(f"jit_cold_run_{i + 1}_artifact_missing")
                if args.require_jit_artifacts:
                    status = "failed"
                    break
            shutil.rmtree(work_dir / ".rvm-cache", ignore_errors=True)

    if status == "ok":
        warmup = run_once(
            args.rvm,
            ["--jit", f"--jit-threshold={args.jit_threshold}"],
            benchmark,
            work_dir,
            args.timeout,
        )
        write_log(log_dir, benchmark, "warmup.jit", warmup)
        for i in range(args.iterations):
            result = run_once(
                args.rvm,
                ["--jit", f"--jit-threshold={args.jit_threshold}"],
                benchmark,
                work_dir,
                args.timeout,
            )
            write_log(log_dir, benchmark, f"timed.jit_warm.{i + 1}", result)
            if result.returncode == 0 and not result.timed_out and same_output(result.stdout, interpreter_check.stdout):
                jit_warm_times.append(result.elapsed_ms)
            else:
                status = "failed"
                notes.append(f"jit_warm_run_{i + 1}_failed")
                break

    interpreter_stats = stat(interpreter_times)
    jit_cold_stats = stat(jit_cold_times)
    jit_warm_stats = stat(jit_warm_times)
    final_artifacts = artifact_count(work_dir)
    if final_artifacts == 0 and "jit_artifact_missing" not in notes:
        notes.append("jit_artifact_missing")

    return {
        "benchmark": benchmark.name,
        "group": benchmark.group,
        "source": str(benchmark.source),
        "status": status,
        "notes": ",".join(dict.fromkeys(notes)),
        "jit_artifacts": final_artifacts,
        "interpreter_min_ms": interpreter_stats.min_ms,
        "interpreter_median_ms": interpreter_stats.median_ms,
        "interpreter_mean_ms": interpreter_stats.mean_ms,
        "jit_cold_min_ms": jit_cold_stats.min_ms,
        "jit_cold_median_ms": jit_cold_stats.median_ms,
        "jit_cold_mean_ms": jit_cold_stats.mean_ms,
        "jit_warm_min_ms": jit_warm_stats.min_ms,
        "jit_warm_median_ms": jit_warm_stats.median_ms,
        "jit_warm_mean_ms": jit_warm_stats.mean_ms,
        "jit_cold_speedup": speedup(interpreter_stats.median_ms, jit_cold_stats.median_ms),
        "jit_warm_speedup": speedup(interpreter_stats.median_ms, jit_warm_stats.median_ms),
    }


def write_csv(path: Path, rows: list[dict[str, object]]) -> None:
    fields = [
        "benchmark",
        "group",
        "source",
        "status",
        "notes",
        "jit_artifacts",
        "interpreter_min_ms",
        "interpreter_median_ms",
        "interpreter_mean_ms",
        "jit_cold_min_ms",
        "jit_cold_median_ms",
        "jit_cold_mean_ms",
        "jit_warm_min_ms",
        "jit_warm_median_ms",
        "jit_warm_mean_ms",
        "jit_cold_speedup",
        "jit_warm_speedup",
    ]
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        for row in rows:
            writer.writerow({field: row.get(field, "") for field in fields})


def write_markdown(path: Path, rows: list[dict[str, object]], args: argparse.Namespace) -> None:
    lines = [
        "# RVM Benchmark Results",
        "",
        f"- iterations: {args.iterations}",
        f"- jit threshold: {args.jit_threshold}",
        f"- require jit artifacts: {args.require_jit_artifacts}",
        "",
        "| benchmark | status | interp median ms | jit cold median ms | jit warm median ms | cold speedup | warm speedup | artifacts | notes |",
        "| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | --- |",
    ]
    for row in rows:
        lines.append(
            "| {benchmark} | {status} | {interp} | {cold} | {warm} | {cold_speedup} | {warm_speedup} | {artifacts} | {notes} |".format(
                benchmark=row["benchmark"],
                status=row["status"],
                interp=fmt(row["interpreter_median_ms"]),
                cold=fmt(row["jit_cold_median_ms"]),
                warm=fmt(row["jit_warm_median_ms"]),
                cold_speedup=fmt(row["jit_cold_speedup"]),
                warm_speedup=fmt(row["jit_warm_speedup"]),
                artifacts=row["jit_artifacts"],
                notes=row["notes"],
            )
        )
    lines.append("")
    path.write_text("\n".join(lines))


def candidate_score(row: dict[str, object]) -> tuple[int, float, float, int]:
    status_score = 1 if row["status"] == "ok" else 0
    warm_speedup = row["jit_warm_speedup"] if isinstance(row["jit_warm_speedup"], float) else 0.0
    cold_speedup = row["jit_cold_speedup"] if isinstance(row["jit_cold_speedup"], float) else 0.0
    artifacts = row["jit_artifacts"] if isinstance(row["jit_artifacts"], int) else 0
    return (status_score, warm_speedup, cold_speedup, artifacts)


def write_candidates(results_dir: Path, rows: list[dict[str, object]]) -> None:
    candidates = [
        row for row in rows
        if row["status"] == "ok"
        and isinstance(row["jit_warm_speedup"], float)
        and row["jit_warm_speedup"] > 1.0
        and isinstance(row["jit_artifacts"], int)
        and row["jit_artifacts"] > 0
    ]
    candidates.sort(key=candidate_score, reverse=True)

    candidate_csv = results_dir / "benchmark-candidates.csv"
    write_csv(candidate_csv, candidates)

    lines = [
        "# RVM Benchmark Candidates",
        "",
        "Only correctness-passing benchmarks with JIT artifacts and warm speedup > 1.0 are listed.",
        "",
        "| rank | benchmark | warm speedup | cold speedup | interp median ms | jit warm median ms | artifacts | notes |",
        "| ---: | --- | ---: | ---: | ---: | ---: | ---: | --- |",
    ]
    for rank, row in enumerate(candidates, start=1):
        lines.append(
            "| {rank} | {benchmark} | {warm_speedup} | {cold_speedup} | {interp} | {warm} | {artifacts} | {notes} |".format(
                rank=rank,
                benchmark=row["benchmark"],
                warm_speedup=fmt(row["jit_warm_speedup"]),
                cold_speedup=fmt(row["jit_cold_speedup"]),
                interp=fmt(row["interpreter_median_ms"]),
                warm=fmt(row["jit_warm_median_ms"]),
                artifacts=row["jit_artifacts"],
                notes=row["notes"],
            )
        )
    lines.append("")
    (results_dir / "benchmark-candidates.md").write_text("\n".join(lines))


def main() -> int:
    args = parse_args()
    if args.iterations <= 0:
        print("--iterations must be positive", file=sys.stderr)
        return 2
    if not args.rvm.is_file():
        print(f"RVM launcher not found: {args.rvm}", file=sys.stderr)
        print("Run `./gradlew installDist` or `make build` first.", file=sys.stderr)
        return 2

    args.results_dir.mkdir(parents=True, exist_ok=True)
    try:
        benchmarks = load_suite_file(args.suite_file) if args.suite_file else discover_benchmarks(args)
    except ValueError as error:
        print(error, file=sys.stderr)
        return 2
    if not benchmarks:
        print("No benchmarks discovered.", file=sys.stderr)
        return 2

    rows: list[dict[str, object]] = []
    for benchmark in benchmarks:
        print(f"==> {benchmark.name}", flush=True)
        rows.append(run_benchmark(args, benchmark))

    write_csv(args.results_dir / "benchmark-results.csv", rows)
    write_markdown(args.results_dir / "benchmark-results.md", rows, args)
    if args.discover:
        write_candidates(args.results_dir, rows)
    failed = [row for row in rows if row["status"] == "failed"]
    print(f"Wrote {args.results_dir / 'benchmark-results.csv'}")
    print(f"Wrote {args.results_dir / 'benchmark-results.md'}")
    if args.discover:
        print(f"Wrote {args.results_dir / 'benchmark-candidates.csv'}")
        print(f"Wrote {args.results_dir / 'benchmark-candidates.md'}")
    if failed and not args.discover:
        print(f"{len(failed)} benchmark(s) failed; see Markdown/CSV for details.", file=sys.stderr)
        return 1
    if failed:
        print(f"{len(failed)} benchmark(s) failed; discovery report still written.", file=sys.stderr)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
