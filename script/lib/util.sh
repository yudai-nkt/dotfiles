#!/bin/bash

function is_inroot() {
  if [[ ${1%/*} == ${1} ]]; then
    return 0
  else
    return 1
  fi
}

function is_macos() {
  if [[ $(uname) == "Darwin" ]]; then
    return 0
  else
    return 1
  fi
}

function is_available() {
  which "$1" >/dev/null 2>&1
  return $?
}

function abort() {
  echo "$1"
  exit 1
}
