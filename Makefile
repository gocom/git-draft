.PHONY: all build help install

all: help

install:
ifeq ($(PREFIX),)
	@echo "PREFIX not set, only making bin/git-draft executable" >&2
	chmod +x bin/git-draft
else
	@echo "Copying git-draft to $PREFIX" >&2
	cp bin/git-draft "$PREFIX/git-draft"
	chmod +x "$PREFIX/git-draft"
endif

help:
	@echo "Manage project"
	@echo ""
	@echo "Usage:"
	@echo ""
	@echo "  $$ make <command> ["
	@echo "    [PREFIX=<path>]"
	@echo "  ]"
	@echo ""
	@echo "Commands:"
	@echo ""
	@echo "  $$ make install"
	@echo "  Copies the binary to PREFIX"
	@echo ""
