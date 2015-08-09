#!/usr/bin/env bats

@test "appium should be in the path" {
  [ "$(command -v /tmp/node-binary/bin/appium)" ]
}
