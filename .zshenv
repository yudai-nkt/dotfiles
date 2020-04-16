# PATH needs to be set up first because some commands are used later on
typeset -U path manpath
[ -x /usr/libexec/path_helper ] && eval $(/usr/libexec/path_helper -s)
export path=(
  $HOME/.poetry/bin(N-/)
  $HOME/.nodebrew/current/bin(N-/)
  $HOME/bin(N-/)
  /usr/local/opt/coreutils/libexec/gnubin(N-/)
  /usr/local/opt/gnu-sed/libexec/gnubin(N-/)
  /usr/local/opt/gnu-tar/libexec/gnubin(N-/)
  /usr/local/bin(N-/)
  $path
)
export manpath=(
  /usr/local/opt/coreutils/libexec/gnuman(N-/)
  /usr/local/opt/gnu-sed/libexec/gnuman(N-/)
  /usr/local/opt/gnu-tar/libexec/gnuman(N-/)
  $manpath
)

# XDG Base Directory Specification
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share

# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
export ZPLUG_BIN=${HOME}/bin
export ZPLUG_REPOS=${XDG_DATA_HOME}/zplug
export ZPLUG_LOADFILE=${XDG_CONFIG_HOME}/zplug/packages.zsh
export ZPLUG_CACHE_DIR=${XDG_CACHE_HOME}/zplug

# Homebrew
export HOMEBREW_CACHE=${XDG_CACHE_HOME}/homebrew
export HOMEBREW_LOGS=${XDG_CACHE_HOME}/homebrew/log

export GIBO_BOILERPLATES=${XDG_DATA_HOME}/gibo

export BREW_PREFIX=$(brew --prefix)
export GOPATH=${HOME}
export GHQ_ROOT=${GOPATH}/src
export LANG=ja_JP.UTF-8
export PAGER=less
export LESS='--hilite-search --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS'
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000
export EDITOR=vim
export PIPENV_VENV_IN_PROJECT=true
export PYENV_ROOT=${XDG_DATA_HOME}/pyenv

setopt no_global_rcs
