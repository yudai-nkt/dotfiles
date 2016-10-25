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
echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"
function chpwd() { echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"}

# prompt
PROMPT='%(?.😊  %F{blue}%~%f
%F{red}❯%f%F{yellow}❯%f%F{green}❯%f .😱  %F{blue}%~%f
%F{red}❯%f%F{yellow}❯%f%F{green}❯%f )'

SPROMPT='❓
%F{red}Did you mean:%f %B%F{blue}%r%f%b [Yes, No, Abort, Edit]: '

RPROMPT='$(git_branch_status)'

# the following function is based on http://d.hatena.ne.jp/uasi/20091017/1255712789.
function git_branch_status {
    local branch st num_color num_stashed result

    if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
        return
    fi

    branch="$(git symbolic-ref --short --quiet HEAD 2> /dev/null)"
    if [[ -z $branch ]]; then
        return
    fi

    st=$(git status 2> /dev/null)
    if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
        num_color=82
    else
        num_color=226
    fi

    result="%{\e[38;5;${num_color}m%}$branch%{\e[m%}$is_stashed"

    num_stashed=$(git stash list | wc -l | tr -d ' ')
    if [[ $num_stashed -gt 0 ]]; then
        result+="📝"
    fi

    echo -e "$result"
}

# command alias
case ${OSTYPE} in
    darwin*)
        alias mkdir='mkdir -p'
        alias ls='ls -G'
        alias la='ls -A'
        alias ll='ls -l'
        alias lsdots='ls -ad .*'
        alias uptex2pdf='ptex2pdf -u -l -ot "-file-line-error"'
        ;;
    linux*)
        ;;
esac

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.zplug/init.zsh ] && source ~/.zplug/init.zsh
zplug "b4b4r07/enhancd", use:"init.sh"
zplug load

# added by travis gem
[ -f /Users/yudai-nkt/.travis/travis.sh ] && source /Users/yudai-nkt/.travis/travis.sh
