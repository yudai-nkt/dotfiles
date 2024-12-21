# PATH needs to be set up first because some commands are used later on
typeset -U path manpath
[ -x /usr/libexec/path_helper ] && eval $(/usr/libexec/path_helper -s)
export path=(
  /opt/homebrew/bin(N-/)
  $path
)
export BREW_PREFIX=$(brew --prefix)
path=(
  $(aqua root-dir)/bin(N-/)
  $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin(N-/)
  $HOME/.cargo/bin(N-/)
  $HOME/.deno/bin(N-/)
  $HOME/.poetry/bin(N-/)
  $HOME/.nodebrew/current/bin(N-/)
  $HOME/bin(N-/)
  $BREW_PREFIX/opt/coreutils/libexec/gnubin(N-/)
  $BREW_PREFIX/opt/gnu-sed/libexec/gnubin(N-/)
  $BREW_PREFIX/opt/gnu-tar/libexec/gnubin(N-/)
  /usr/local/bin(N-/)
  $path
)
export manpath=(
  $BREW_PREFIX/opt/coreutils/libexec/gnuman(N-/)
  $BREW_PREFIX/opt/gnu-sed/libexec/gnuman(N-/)
  $BREW_PREFIX/opt/gnu-tar/libexec/gnuman(N-/)
  $manpath
)
# This append the system default MANPATH
MANPATH=$MANPATH:

# XDG Base Directory Specification
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_STATE_HOME=${HOME}/.local/state

# Homebrew
export HOMEBREW_CACHE=${XDG_CACHE_HOME}/homebrew
export HOMEBREW_LOGS=${XDG_STATE_HOME}/homebrew/log

# Aqua
export AQUA_GLOBAL_CONFIG=${XDG_CONFIG_HOME}/aquaproj-aqua/aqua.yaml

# tealdeer
export TEALDEER_CONFIG_DIR=${XDG_CONFIG_HOME}/tealdeer
export TEALDEER_CACHE_DIR=${XDG_CACHE_HOME}/tealdeer

export GIBO_BOILERPLATES=${XDG_DATA_HOME}/gibo

export GOPATH=${HOME}
export LANG=ja_JP.UTF-8
export PAGER=less
export LESS='--hilite-search --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS'
export MANPAGER="sh -c 'col -bx | bat --language=man --plain'"
export HISTFILE=${XDG_STATE_HOME}/zsh/history
export HISTSIZE=1000000
export SAVEHIST=1000000
export EDITOR=vim
export PIPENV_VENV_IN_PROJECT=true
export PYENV_ROOT=${XDG_DATA_HOME}/pyenv

# Node and npm
export NODE_REPL_HISTORY=${XDG_STATE_HOME}/node/history
export NPM_CONFIG_USERCONFIG=${XDG_CONFIG_HOME}/npm/config
# export COOKIECUTTER_CONFIG=$XDG_CONFIG_HOME/cookiecutter/config.yaml

# Deno
export DENO_DIR=${XDG_CACHE_HOME}/deno

# Starship
export STARSHIP_CONFIG=${XDG_CONFIG_HOME}/starship/config.toml
export STARSHIP_CACHE=${XDG_STATE_HOME}/starship

# GPG signing (cf. https://stackoverflow.com/a/57591830)
export GPG_TTY=${TTY}

setopt no_global_rcs
