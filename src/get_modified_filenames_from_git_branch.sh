#!/bin/bash -x

# Prints a list of extracted files into stdout as a shell variable (Pipe version)
# Must be inside a git repository for it to work properly
# e.g.
# get_modified_filenames_from_git_branch_via_pipes origin/master
get_modified_filenames_from_git_branch_via_pipes() {
    local branch_name=$1
    git log $branch_name -n 1 --pretty=format:"%H" | xargs git diff --name-only | xargs | xargs -I modified_filenames echo 'export MODIFIED_FILENAMES="modified_filenames"' | xargs echo
}

# Prints a list of extracted files into a file saved as a shell variable (Nested commands version)
# Must be inside a git repository for it to work properly
# e.g.
# get_modified_filenames_from_git_branch_via_nested_commands origin/master
get_modified_filenames_from_git_branch_via_nested_commands() {
    local branch_name=$1
    echo "export MODIFIED_FILENAMES=\"$(git diff --name-only $(git log $branch_name -n 1 --pretty=format:"%H") | tr '\n' ' ')\""
}
