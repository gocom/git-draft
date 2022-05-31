PATH="$PWD/src:$PWD/bin:$PATH"

setup () {
  if ! [[ -e test/mock/repository ]]; then
    mock-repository test/mock/repository test/mock/commits
  fi

  cd test/mock/repository || true

  git checkout main 2> /dev/null
  git branch -D release/mock-test 2> /dev/null || true
  git checkout HEAD~100 2> /dev/null
  git checkout -b release/mock-test 2> /dev/null
}

@test "--dry-run --new" {
  run git-draft main PRD-3893 --dry-run --new
  [[ "$status" -eq 0 ]]
}

@test "--dry-run --all" {
  run git-draft main PRD-3893 --dry-run --all
  [[ "$status" -eq 0 ]]
}

teardown() {
  git checkout main 2> /dev/null
  git branch -D release/mock-test > /dev/null
  cd ../../../
}
