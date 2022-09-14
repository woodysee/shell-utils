#!/bin/bash -x

# cd that allows switching between different git profiles
# How to use:
# - Copy this function into your `~/.bashrc` or `~/.bash_profile`
# TODO: 
# - Not to add same token
# - Prevent asking of password 
cd() {
  builtin cd "$@";
  
  local is_git_repo=true
  # 2>&1 redirects stderr to stdout and then captures the output. 
  local git_status_output="$(git status 2>&1)"

  local is_git_repo_regex=fatal\:\ not\ a\ git\ repository
  if [[ "$git_status_output" =~ $is_git_repo_regex  ]] ; then
    is_git_repo=false
  fi

  if [[ "$is_git_repo" == true ]]; then

    local part_of_main_token_area_regex=^\/home\/.+\/main_folder
    local part_of_other_token_area_regex=^\/home\/.+\/other_folder
    if [[ "$(pwd)" =~ $part_of_wsk_token_area_regex ]] ; then
      echo "Using main git credentials."
      git config user.name "main"
      git config user.email "main_token@gmail.com"
      eval $(ssh-agent) && ssh-add ~/.ssh/main-github
    fi


    if [[ "$(pwd)" =~ $part_of_other_token_area_regex ]] ; then
      echo "Using other git credentials."
      git config user.name "other"
      git config user.email "other_token@gmail.com"
      eval $(ssh-agent) && ssh-add ~/.ssh/other-github
    fi

  fi

}