# Japanese file name available
setopt print_eight_bit

# typo correction
setopt correct

# enable tab completion
autoload -Uz compinit
compinit

# color
autoload -U colors
colors

# disregard small/capital when tab completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# run 'cd' with a directory path if no similar commands are found
setopt auto_cd

# select completion candidates by tab
setopt auto_menu

# omit the current directory from completion candidates
zstyle ':completion:*' ignore-parents parent pwd ..

# hash sign available also in CLI
setopt interactive_comments

# display current directory on tab
echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"
function chpwd() { echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"}

# prompt
PROMPT='%(?.😊  %F{blue}%~%f
%F{red}❯%f%F{yellow}❯%f%F{green}❯%f .😱  %F{blue}%~%f
%F{red}❯%f%F{yellow}❯%f%F{green}❯%f )'

SPROMPT='❓
zsh: %F{red}Did you mean:%f %F{blue}%r%f [Yes, No, Abort, Edit]: '

# command alias
alias la='ls -aGF'
alias ll='ls -lGF'
alias ldots='ls -adGF .*'
alias reload='source $HOME/.zshrc'
alias ptex2pdf='ptex2pdf -u -l -ot "-synctex=1 -file-line-error"'
alias activitymonitor='open "/Applications/Utilities/Activity Monitor.app"'
