% GIT-DRAFT(1)
% Jukka Svahn
% May 2022

# NAME

git-draft -- Interactively cherry-picks commits by a keyword

# SYNOPSIS

**git-draft** [*options*] `<`*source-branch*`>` `<`*keyword* ...`>`

# DESCRIPTION

Interactively cherry-picks commits by searching their messages for a keyword.

This tool is intended for tasks where set of commits need to be taken
to a target branch in their original commit date order. This could, for
instance, be used to build release branches from a main branch.

# OPTIONS

`-h`, `--help`
: Print help.

`-v`, `--version`
: Print version number.

`-D`, `--dry-run`
: Dry-run without writing. Executed command will not write or change anything,
but will simulate or list the actions it would do.

`-S`, `--silent`, `-Q`, `--quiet`
: Silent mode. Does not output anything or prompt for user-input. This could be
used for scripting and automation purposes.

`-V`, `--verbose`
: Verbose output. Prints more information about the commands being run to
standard output.

`--color`
: Enable color output. Colors are enabled even if terminal emulator support was
not detected.

`--no-color`
: Disables color output. This can be useful if the output is piped to a file.

`--stdin`
: If specified, *source branch* and *keywords* are read from standard input.

`-r`, `--revert`
: Instead of cherry-picking, search and revert commits from the
currently active branch. *source-branch* is not using, when reverting
commits using this option.

`-all`
: Instead of prompting for commit selection, cherry-picks all matching commits.

`-new`
: Instead of prompting for commit selection, cherry-picks all commits that are
not yet present in the current branch. Commits are identified and matched based
on their commit message.

*source-branch*
: Branch where the search commits are cherry-picked from. Not used
if `-r` or `--revert` option is used.

*keyword*
: Keyword to search for. The keyword is searched from the commit message.

# ENVIRONMENT

`TERM`
: Is used to figure out terminal color support.

# FILES

Depends on external programs `bash`, `cat`, `git`, `grep` and `tput`, and uses
`readline`.

# EXAMPLES

Changes to a release branch and from `main` branch cherry-picks 4 Jira tickets,
which numbers are specified in the commit messages, to it:

    $ git checkout release/2022-01
    $ git draft main JIRA-894 JIRA-101 JIRA-202 JIRA-1234

Cherry-picks all new matching commits to the release branch. Commits are matched
based on their commit message:

    $ git checkout release/2022-01
    $ git draft main JIRA-894 JIRA-101 JIRA-202 JIRA-1234 --new

Revert commits that contain the given keywords from the currently active branch:

    $ git draft JIRA-894 JIRA-101 JIRA-202 JIRA-1234 --revert
