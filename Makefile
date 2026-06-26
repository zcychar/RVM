.PHONY: build test run docker-build docker-shell docker-run docker-test

GRADLE ?= ../gradlew
RX ?=
DOCKER ?= docker
DOCKER_IMAGE ?= rvm-jit
DOCKER_TTY ?= -it
DOCKER_WORK_ROOT ?= $(abspath ..)
DOCKER_RUN = $(DOCKER) run --rm $(DOCKER_TTY) \
	-v $(DOCKER_WORK_ROOT):/work \
	-w /work/RVM \
	-e GRADLE_USER_HOME=/work/RVM/.gradle-docker \
	$(DOCKER_IMAGE)

build:
	$(GRADLE) build

test:
	$(GRADLE) test

run:
	$(GRADLE) run --args="$(RX)"

docker-build:
	$(DOCKER) build -f Dockerfile.jit -t $(DOCKER_IMAGE) .

docker-shell:
	$(DOCKER_RUN) bash

docker-run:
	@test -n "$(RX)" || (echo 'usage: make docker-run RX="--jit benchmarks/rvm-rx/hot_scalar_loop.rx"'; exit 2)
	$(DOCKER_RUN) ./gradlew run --args="$(RX)"

docker-test:
	$(DOCKER_RUN) ./gradlew test
