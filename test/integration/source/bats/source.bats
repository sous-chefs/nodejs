#!/usr/bin/env bats

@test "node should be in the path" {
  [ "$(command -v node)" ]
}
