#!/usr/bin/env bats

setup() {
    # https://bats-core.readthedocs.io/en/stable/tutorial.html#let-s-do-some-setup
    ## get the containing directory of this file
    ## use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    ## as those will point to the bats executable's location or the preprocessed file respectively
    DIR="$(cd "$(dirname "$BATS_TEST_FILENAME")" >/dev/null 2>&1 && pwd)"
    # make executables in src/ visible to PATH
    PATH="$DIR/../src:$PATH"
}

@test "can run our script" {
    cd_with_git.sh
}
