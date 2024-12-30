# dotfiles

My dotfiles and setup scripts

## Overview
This repository shouldn't need further introduction thanks to the pretty self-explanatory name.

## Supported Platforms

Setup scripts are tested on GitHub Actions weekly and whenever changes in
relevant files are committed to the main branch.
The test runs on the following runners.

- `macos-latest`

## Content
This repository contains dotfiles of the following softwares:

- [EditorConfig][editorconfig]
- [Git][git]
- [Matplotlib][matplotlib]
- [Zsh][zsh]

## Usage
Just clone the repository and run `make install`.

```zsh
git clone git@github.com:yudai-nkt/dotfiles.git
cd ./dotfiles && make install
```

Make is employed as deployment tool.
The complete list of available targets and their purposes is detailed below.

| Target | Description |
| :-- | :-- |
| `install` | Execute `make update` and `make symlink` sequentially and restart the shell |
| `list` | Show the list of dotfiles to be deployed |
| `symlink` | Create symlinks of dotfiles to be deployed |
| `update` | Sync with the remote repository |

<!--links-->
[editorconfig]: http://editorconfig.org/
[git]: https://git-scm.com/
[matplotlib]: https://matplotlib.org/
[zsh]: http://zsh.sourceforge.net/
