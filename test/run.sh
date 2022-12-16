#!/bin/bash -x

current_dir="$(dirname ${BASH_SOURCE[0]})"

$current_dir/bats/bin/bats $current_dir/test.bats
