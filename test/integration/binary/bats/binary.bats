#!/usr/bin/env bats

@test "node should be in the path" {
  result="$(which node)"
  [ "$result" == "/usr/local/bin/node" ]
}

@test "npm should be in the path" {
  result="$(which npm)"
  [ "$result" == "/usr/local/bin/npm" ]
}
