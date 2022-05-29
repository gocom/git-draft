.PHONY: all build-src build-man clean docker-build help install lint mock-commits mock-repository process-reports test test-unit

VERSION?=0.0.0
RUN = docker-compose run --rm build

all: help

build:
	$(MAKE) build-src
	$(MAKE) build-man

build-src:
	$(RUN) bash -c 'mkdir -p build/bin && cp src/git-draft build/bin/git-draft && sed -i "s/@{{VERSION}}/$(VERSION)/" build/bin/git-draft && chmod +x build/bin/git-draft'
	$(RUN) cp -r src/extra build/extra

build-man:
	$(RUN) bash -c 'mkdir -p build/man/man1/ && pandoc -s -f markdown -t man -o build/man/man1/git-draft.1 man/man1/git-draft.1.md'

clean:
	$(RUN) rm -rf build dist

dist: build
	$(RUN) bash -c 'mkdir -p dist && cp LICENSE build/LICENSE && cd build && zip -r ../dist/git-draft.zip  .'

install: build
ifeq ($(PREFIX),)
	@echo "PREFIX not set, only building" >&2
else
	@echo "Copying git-draft to $PREFIX" >&2
	cp src/git-draft "$PREFIX/git-draft"
	chmod +x "$PREFIX/git-draft"
endif

lint:
	$(RUN) shellcheck bin/* src/git-draft

process-reports:
	$(RUN) bash -c "test -e coverage/bats.*/sonarqube.xml && sed 's/\/app\///' coverage/bats.*/cobertura.xml > coverage/cobertura.xml"

test: lint test-unit

test-unit:
	$(RUN) bash -c "mkdir -p test-report && kcov --clean --bash-dont-parse-binary-dir --include-path=/app/src /app/coverage bats --recursive --formatter tap --report-formatter junit --output /app/test-report test"

docker-build:
	docker-compose build build

mock-commits:
	$(RUN) bash -c "mkdir -p test/mock && bin/mock-commit-messages > test/mock/commits"

mock-repository:
	$(RUN) bash -c "bin/mock-repository test/mock/repository test/mock/commits"

help:
	@echo "Manage project"
	@echo ""
	@echo "Usage:"
	@echo ""
	@echo "  $$ make <command> ["
	@echo "    [PREFIX=<path>]"
	@echo "    [VERSION=<number>]"
	@echo "  ]"
	@echo ""
	@echo "Commands:"
	@echo ""
	@echo "  $$ make build"
	@echo "  Builds an executable"
	@echo ""
	@echo "  $$ make clean"
	@echo "  Removes built files"
	@echo ""
	@echo "  $$ make dist"
	@echo "  Packages a distributable archive"
	@echo ""
	@echo "  $$ make install"
	@echo "  Builds and copies the executable to PREFIX"
	@echo ""
	@echo "  $$ make lint"
	@echo "  Check code style"
	@echo ""
	@echo "  $$ make test"
	@echo "  Runs full test suite and linter"
	@echo ""
	@echo "  $$ make test-unit"
	@echo "  Runs only unit tests"
	@echo ""
	@echo "  $$ make docker-build"
	@echo "  Re-builds the Docker image"
	@echo ""
	@echo "  $$ make process-reports"
	@echo "  Formats test reports to use relative local file paths"
	@echo ""
	@echo "Environment variables:"
	@echo ""
	@echo "  PREFIX"
	@echo "  Path to a directory where the executable is installed to"
	@echo ""
	@echo "  VERSION"
	@echo "  Version number that is used when building an executable"
	@echo ""
