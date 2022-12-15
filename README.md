# shell-utils

General purpose shell functions

## Starting

This project uses `bats` for testing. In order to use the testing environment:

```bash
# Initialise local configuration file
git submodule init
# Fetch all local data from bats remote upstream
git submodule update
# If your shell user do not already have rwx permissions for scripts inside src
chmod 755 src
```

To learn more about working with git submodules, see <https://git-scm.com/book/en/v2/Git-Tools-Submodules>.
