.PHONY: all clean help install lint test

VERSION?=0.0.0
RUN = docker-compose run --rm build

all: help

build:
	$(RUN) bash -c 'mkdir -p build && cp src/git-draft build/git-draft && sed -i "s/@{{VERSION}}/$(VERSION)/" build/git-draft && chmod +x build/git-draft'

clean:
	$(RUN) rm -rf build dist

dist: build
	$(RUN) bash -c 'mkdir -p dist && cd build && zip -r ../dist/git-draft.zip  .'

install: build
ifeq ($(PREFIX),)
	@echo "PREFIX not set, only building" >&2
else
	@echo "Copying git-draft to $PREFIX" >&2
	cp src/git-draft "$PREFIX/git-draft"
	chmod +x "$PREFIX/git-draft"
endif

lint:
	$(RUN) shellcheck src/git-draft

test: lint

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
	@echo "  Builds executable"
	@echo ""
	@echo "  $$ make clean"
	@echo "  Removes built files"
	@echo ""
	@echo "  $$ make dist"
	@echo "  Package"
	@echo ""
	@echo "  $$ make install"
	@echo "  Builds and copies the executable to PREFIX"
	@echo ""
	@echo "  $$ make lint"
	@echo "  Check code style"
	@echo ""
	@echo "  $$ make test"
	@echo "  Runs tests"
	@echo ""
