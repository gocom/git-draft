PATH="$PWD/src:$PATH"

@test "--help" {
  run git-draft --help
  [[ "$status" -eq 0 ]]
}

@test "-h" {
  run git-draft -h
  [[ "$status" -eq 0 ]]
}

@test "--version" {
  run git-draft --version
  [[ "$status" -eq 0 ]]
}

@test "-v" {
  run git-draft -v
  [[ "$status" -eq 0 ]]
}

@test "--invalid" {
  run git-draft --invalid
  [[ "$status" -eq 1 ]]
}
