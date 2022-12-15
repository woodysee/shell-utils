#!/bin/bash -x

# This should work for at least Darwin/macOS and Ubuntu Linux distros
# The inclusion of output redirection (>/dev/null 2>&1) handles the rare(?)
# case where cd might produce output that would interfere with the surrounding $( ... )
# capture. (Such as cd being overridden to also ls a directory after switching to it.)
# The -- after cd and before "${BASH_SOURCE[0]:-$0}" are in case the directory starts with a -.
# See https://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself
# ${BASH_SOURCE[0]:-$0} in case `sh` is not aliased to `bash` and to another shell like `zsh`
get_this_script_dir_when_no_symlinks() {
  echo $(
    cd -- "$(dirname ${BASH_SOURCE[0]}:-$0)" >/dev/null 2>&1
    pwd -P
  )
}
