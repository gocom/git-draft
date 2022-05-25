PATH="$PWD/src:$PATH"

@test "--help argument" {
  run git-draft --help
  [[ "$status" -eq 0 ]]
  [[ "$output" == *git-draft* ]]
}
