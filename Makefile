.DEFAULT_GOAL := help

.PHONY: help build test run benchmark benchmark-quick benchmark-clean docker-build docker-shell docker-run docker-test docker-benchmark-discover docker-benchmark docker-benchmark-quick

GRADLE ?= ../gradlew
GRADLE_USER_HOME ?= $(CURDIR)/.gradle-user-home
PYTHON ?= python3
RX ?=
BENCHMARK_ITERATIONS ?= 5
BENCHMARK_QUICK_ITERATIONS ?= 2
BENCHMARK_JIT_THRESHOLD ?= 1
BENCHMARK_COMPREHENSIVE_RANGE ?= 1:50
BENCHMARK_QUICK_COMPREHENSIVE_RANGE ?= 1:3
BENCHMARK_SUITE ?= benchmarks/benchmark-suite.txt
BENCHMARK_TIMEOUT ?= 60
BENCHMARK_RESULTS_DIR ?= benchmarks/results
DOCKER ?= docker
DOCKER_IMAGE ?= rvm-jit
DOCKER_TTY ?= -it
DOCKER_WORK_ROOT ?= $(abspath ..)
DOCKER_RUN = $(DOCKER) run --rm $(DOCKER_TTY) \
	-v $(DOCKER_WORK_ROOT):/work \
	-w /work/RVM \
	-e GRADLE_USER_HOME=/work/RVM/.gradle-docker \
	$(DOCKER_IMAGE)
DOCKER_RUN_BATCH = $(DOCKER) run --rm \
	-v $(DOCKER_WORK_ROOT):/work \
	-w /work/RVM \
	-e GRADLE_USER_HOME=/work/RVM/.gradle-docker \
	$(DOCKER_IMAGE)

export GRADLE_USER_HOME

help:
	@echo 'Common commands:'
	@echo '  make build'
	@echo '  make test'
	@echo '  make run RX="--no-jit benchmarks/rvm-rx/hot_scalar_loop.rx"'
	@echo '  make benchmark'
	@echo '  make benchmark-quick'
	@echo '  make benchmark-clean'
	@echo '  make docker-build'
	@echo '  make docker-run RX="--jit benchmarks/rvm-rx/hot_scalar_loop.rx"'
	@echo '  make docker-shell'
	@echo '  make docker-test'
	@echo '  make docker-benchmark-discover'
	@echo '  make docker-benchmark'
	@echo '  make docker-benchmark-quick'

build:
	$(GRADLE) build

test:
	$(GRADLE) test

run:
	@test -n "$(RX)" || (echo 'usage: make run RX="--no-jit benchmarks/rvm-rx/hot_scalar_loop.rx"'; exit 2)
	$(GRADLE) run --args="$(RX)"

benchmark:
	$(GRADLE) installDist
	$(PYTHON) scripts/benchmark-rvm.py \
		--results-dir $(BENCHMARK_RESULTS_DIR) \
		--iterations $(BENCHMARK_ITERATIONS) \
		--jit-threshold $(BENCHMARK_JIT_THRESHOLD) \
		--comprehensive-range $(BENCHMARK_COMPREHENSIVE_RANGE)

benchmark-quick:
	$(GRADLE) installDist
	$(PYTHON) scripts/benchmark-rvm.py \
		--results-dir $(BENCHMARK_RESULTS_DIR) \
		--iterations $(BENCHMARK_QUICK_ITERATIONS) \
		--jit-threshold $(BENCHMARK_JIT_THRESHOLD) \
		--comprehensive-range $(BENCHMARK_QUICK_COMPREHENSIVE_RANGE)

benchmark-clean:
	rm -rf .rvm-cache benchmarks/results

docker-build:
	$(DOCKER) build -f Dockerfile.jit -t $(DOCKER_IMAGE) .

docker-shell:
	$(DOCKER_RUN) bash

docker-run:
	@test -n "$(RX)" || (echo 'usage: make docker-run RX="--jit benchmarks/rvm-rx/hot_scalar_loop.rx"'; exit 2)
	$(DOCKER_RUN) ./gradlew run --args="$(RX)"

docker-test:
	$(DOCKER_RUN) ./gradlew test

docker-benchmark-discover:
	$(DOCKER_RUN_BATCH) ./gradlew installDist
	$(DOCKER_RUN_BATCH) python3 scripts/benchmark-rvm.py \
		--discover \
		--results-dir $(BENCHMARK_RESULTS_DIR) \
		--iterations $(BENCHMARK_ITERATIONS) \
		--jit-threshold $(BENCHMARK_JIT_THRESHOLD) \
		--timeout $(BENCHMARK_TIMEOUT) \
		--comprehensive-range $(BENCHMARK_COMPREHENSIVE_RANGE)

docker-benchmark:
	@test -f "$(BENCHMARK_SUITE)" || (echo 'missing $(BENCHMARK_SUITE); run make docker-benchmark-discover and review candidates first'; exit 2)
	$(DOCKER_RUN_BATCH) ./gradlew installDist
	$(DOCKER_RUN_BATCH) python3 scripts/benchmark-rvm.py \
		--suite-file $(BENCHMARK_SUITE) \
		--results-dir $(BENCHMARK_RESULTS_DIR) \
		--require-jit-artifacts \
		--iterations $(BENCHMARK_ITERATIONS) \
		--jit-threshold $(BENCHMARK_JIT_THRESHOLD) \
		--timeout $(BENCHMARK_TIMEOUT)

docker-benchmark-quick:
	$(DOCKER_RUN_BATCH) ./gradlew installDist
	$(DOCKER_RUN_BATCH) python3 scripts/benchmark-rvm.py \
		--discover \
		--results-dir $(BENCHMARK_RESULTS_DIR) \
		--iterations $(BENCHMARK_QUICK_ITERATIONS) \
		--jit-threshold $(BENCHMARK_JIT_THRESHOLD) \
		--timeout $(BENCHMARK_TIMEOUT) \
		--comprehensive-range $(BENCHMARK_QUICK_COMPREHENSIVE_RANGE)
