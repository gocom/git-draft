# Changelog

## 0.2.0

* Ability to revert commits with `--revert` option. Instead of cherry-picking
  commits, matching commits are reverted from the current branch using revert
  commits.
* Change from `git log` commands' `--grep` option to `GNU grep`. This allows
  using `grep` command's built in word matching support, and speeds up searching
  commits by their message.

## 0.1.2

* Handle cases where there is a different word delimiter character before and
  after the searched keyword in the commit message.

## 0.1.1

* Repackaged 0.1.0.

## 0.1.0

* Initial release.
