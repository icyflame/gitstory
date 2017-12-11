# Git Story

> A set of git repositories always tells a story; Find it!

Supply a root directory to this script, which has the following structure:

```sh
root_dir
|-> project_1
    |-> .git
    |-> project_file_1
    ...
|-> project_2
    |-> .git
    |-> project_file_2
    ...
|-> project_3
    |-> .git
    |-> project_file_3
    ...
```

This script will write to a file the list of commits that have been made in
these git repositories from a given time.
