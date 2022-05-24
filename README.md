git-draft
=====

Extension command for git command-line interface which allows one to
interactively cherry-picks commits by searching their messages for a keyword.

This tool is intended for tasks where a set of commits needs to be taken
to a target branch in their original commit date order. This could, for
instance, be used to build release branches from a main branch based on
issue tracker identifiers as the searched keywords.

Install
-----

Clone the repository, and add `git-draft` to PATH:

```shell
$ git clone https://github.com/gocom/git-draft.git && cd git-draft
$ make install PREFIX=/usr/local/bin/
```

The above would install `git-draft` executable to `/usr/local/bin/`.

Requirements
-----

* Unix-like OS
* git
* [Bash](https://www.gnu.org/software/bash/) >= 4.3

Command-line usage
-----

For available options, run:

```shell
$ git draft --help
```
