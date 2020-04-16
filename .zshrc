# Japanese file name available
setopt print_eight_bit

# emacs keybinding
bindkey -e

# typo correction
setopt correct

# enable tab completion
autoload -Uz compinit
compinit

# color
autoload -Uz colors
colors

# disregard small/capital when tab completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# extended history search
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# share zsh history between processes
setopt share_history

# prevent from adding duplicate command into history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space

# run 'cd' with a directory path if no similar commands are found
setopt auto_cd

# select completion candidates by tab
setopt auto_menu

# omit the current directory from completion candidates
zstyle ':completion:*' ignore-parents parent pwd ..

# hash sign available also in CLI
setopt interactive_comments

# enable function expansion in prompts
setopt prompt_subst

# display current directory on tab
function show_path_on_tab() {
  local path_shortened="${${PWD%/*}##*/}/${PWD##*/}"
  echo -ne "\033]0;${path_shortened}\007"
}
show_path_on_tab
function chpwd() {
  show_path_on_tab
}

function precmd() {
  [[ $? -eq 0 ]] && SPACESHIP_CHAR_SYMBOL='✓ ' || SPACESHIP_CHAR_SYMBOL='✗ '
}

# shell theme
SPACESHIP_GOLANG_SHOW=false

# command alias
alias mkdir='mkdir -p'
alias ls='ls --color=auto --classify --ignore=.DS_Store'
alias la='ls --almost-all'
alias ll='ls -l --human-readable'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

if [[ -f ${ZPLUG_HOME}/init.zsh ]]; then
  source ${ZPLUG_HOME}/init.zsh

  if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
      echo; zplug install
    fi
  fi
  zplug load
fi
