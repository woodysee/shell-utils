#!/bin/bash -x

# This should work for at least Darwin/macOS and Ubuntu Linux distros
# The inclusion of output redirection (>/dev/null 2>&1) handles the rare(?)
# case where cd might produce output that would interfere with the surrounding $( ... )
# capture. (Such as cd being overridden to also ls a directory after switching to it.)
# The -- after cd and before "$0" are in case the directory starts with a -.
# See https://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself
get_this_script_dir() {
  echo $(
    cd -- "$(dirname "$0")" >/dev/null 2>&1
    pwd -P
  )
}