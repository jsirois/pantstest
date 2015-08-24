#!/usr/bin/env bash

function run_test() {
  ./pants -q binary src/python:test && dist/test.pex
}

function apply_change() {
  git apply test.patch
}

function assert_equal() {
  if [[ "$1" != "$2" ]]
  then
    echo "Assertion failed: $1 != $2"
    exit 1
  else 
    echo "Success!"
  fi
}

assert_equal "['C', 'read', 'thrift_spec', 'validate', 'write']" "$(run_test)" && \
apply_change && \
assert_equal "['C', 'Cba', 'Cfoo', 'Cfoobar', 'read', 'thrift_spec', 'validate', 'write']" "$(run_test)"

