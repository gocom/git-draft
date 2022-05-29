git-draft
=====

[![Codecov](https://img.shields.io/codecov/c/github/gocom/git-draft)](https://app.codecov.io/gh/gocom/git-draft/)

Extension command for git command-line interface which allows one to
interactively cherry-picks commits by searching their messages for a keyword.

[![In action](https://raw.githubusercontent.com/gocom/git-draft/screenshots/images/usage.gif)](https://raw.githubusercontent.com/gocom/git-draft/screenshots/images/usage.gif)

This tool is intended for tasks where a set of commits needs to be taken
to a target branch in their original commit date order. This could, for
instance, be used to build release branches from a main branch based on
issue tracker identifiers as the searched keywords.

Install
-----

[Download a release git-draft archive](https://github.com/gocom/git-draft/releases) and extract it.

Requirements
-----

* Unix-like OS
* git
* [Bash](https://www.gnu.org/software/bash/) >= 4.3

Usage
-----

### Command-line usage

For list of available options, run:

```shell
$ git draft --help
```

Development
-----

See [CONTRIBUTING.md](https://github.com/gocom/git-draft/blob/master/CONTRIBUTING.md).
