# .dotfiles

My dotfiles and setup scripts

## Overview
This repository shouldn't need further introduction thanks to the pretty self-explanatory name.

## Content
This repository contains dotfiles of the following softwares:

- [Atom][atom]
- [EditorConfig][editorconfig]
- [Git][git]
- [Matplotlib][matplotlib]
- [Latexmk][latexmk]
- [Zsh][zsh]

## Usage
Just clone the repository and run `make install`.

```zsh
git clone git@github.com:yudai-nkt/.dotfiles.git $HOME/.dotfiles
cd .dotfiles && make install
```

I employ Make for deployment tool.
The complete list of available targets and their purposes is detailed below.

| Target | Description |
| :-- | :-- |
| `install` | Execute `make update` and `make symlink` sequentially and restart the shell |
| `list` | Show the list of dotfiles to be deployed |
| `symlink` | Create symlinks of dotfiles to be deployed |
| `update` | Sync with the remote repository |

<!--links-->
[atom]: https://atom.io/
[editorconfig]: http://editorconfig.org/
[git]: https://git-scm.com/
[matplotlib]: https://matplotlib.org/
[latexmk]: https://www.ctan.org/pkg/latexmk
[zsh]: http://zsh.sourceforge.net/
