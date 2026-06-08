.PHONY: build test run

GRADLE ?= ../gradlew
RX ?=

build:
	$(GRADLE) build

test:
	$(GRADLE) test

run:
	$(GRADLE) run --args="$(RX)"

