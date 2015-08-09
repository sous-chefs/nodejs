#!/usr/bin/env bats

@test "appium should be in the path" {
  [ "$(command -v /tmp/node-source/bin/appium)" ]
}
