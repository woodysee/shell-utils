#!/bin/bash -x

# Must be inside a git repository for it to work properly
get_current_git_branch() {
    local branch_name="$(git symbolic-ref HEAD 2>/dev/null)" || local branch_name="(unnamed branch)"
    local branch_name=${branch_name##refs/heads/}
    echo $branch_name
}
