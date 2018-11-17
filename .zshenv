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

export path=($HOME/.nodebrew/current/bin(N-/) /usr/local/bin /usr/bin /bin /usr/sbin /sbin)
export LANG=ja_JP.UTF-8
export PAGER=less
export LESS='--hilite-search --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS'
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000
export EDITOR=vim
setopt no_global_rcs
