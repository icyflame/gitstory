# Git Story

> A set of git repositories always tells a story; Find it!

## TOC

- [Introduction](#introduction)
- [Usage](#usage)
  - [gitstory](#gitstory)
  - [gitstory_here](#gitstory_here)
- [Install](#install)
- [Attribution](#attribution)
- [License](#license)

## Introduction

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
```

This script will write to a file the list of commits that have been made in
these git repositories since a given time. See [Usage](#usage)

## Usage

### `gitstory`

#### Input

```sh
# to print a list of two repositories

$ ./gitstory [root_dir] [since]

$ ./gitstory ../work_stuff "January 2016"

$ ./gitstory ../academics "1 month"
```

#### Options

`root_dir`

Default: Present directory

`since`

Default: yesterday

#### Sample Output

```sh
$ ./gitstory ../metakgp "Nov 2016"
Found 30 files under ../metakgp
Searching for commits from Nov 2016
Output goes to ./final_out_1513160141.final


gyft: 2017-12-02 - [check the dates input by user for sanity before generating timetable] [426ccec]
gyft: 2017-11-19 - [get working day period from dates and create appropriate events] [252163e]
gyft: 2017-11-19 - [supply duration of an event instead of supplying end date][6c04df3]
gyft: 2017-11-19 - [add the submodule that will return list of lists] [cf8296b]
gyft: 2017-12-05 - [change python to python3, add input/output option to readme][2f5b548]
gyft: 2017-12-05 - [Merge branch 'rohitner-fix-ics-io'] [f3b38e6]

metakgp-wiki: 2017-11-14 - [Merge pull request #27 from icyflame/icyflame/put-peqp-in-static] [ae89734]

mfqp: 2017-11-17 - [fix the sed commands for the new location of papers][a655100]
mfqp: 2017-11-17 - [change the base URL to static.metakgp.org] [7766596]
```

### `gitstory_here`

#### Input

```sh
$ ./gitstory_here [since]

$ ./gitstory_here "1 week"

$ ./gitstory_here "last week"
```

#### Options

since

Default: yesterday

#### Output

```sh
$ ./gitstory_here "last week" 
Found 12 files under ./gitstory
Searching for commits from last week
Output goes to ./here_out_1513160588.final


gitstory: 2017-12-13 - [change name and add appropriate shebang] [fb3d67a]
gitstory: 2017-12-12 - [if repo_name can't be inferred from remote URL, use folder name] [d64384a]
gitstory: 2017-12-11 - [add attrib to abinash's tweet] [f26603f]
gitstory: 2017-12-11 - [introduce debugging; make repository delimiting more consistent] [9891cf0]
gitstory: 2017-12-11 - [put newline between logs of different repos] [5bcdbec]
gitstory: 2017-12-11 - [ignore output files] [4bfaea5]
gitstory: 2017-12-11 - [initial commit] [09c11c4]
```

## Install

Get the script and move it into a folder that's in the `$PATH`

```sh
$ wget https://raw.githubusercontent.com/icyflame/gitstory/master/gitstory
$ mv gitstory /usr/local/bin
```

There's another script called
[`gitstory_here`](https://raw.githubusercontent.com/icyflame/gitstory/master/gitstory)
which takes the present folder and prints something similar. That script is
useful if you only have one folder which you want to track.

## Attribution

The idea came from [Abinash's](https://github.com/abinashmeher999)
[tweet](https://twitter.com/beenharsh/status/935096376211279872)

[![img](./tweet.png)](https://twitter.com/beenharsh/status/935096376211279872)

## License

Code licensed under MIT

Copyright (C) 2017  Siddharth Kannan <kannan.siddharth12@gmail.com>
