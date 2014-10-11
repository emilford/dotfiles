export PATH="./bin:/usr/local/bin:$PATH:/usr/local/share/npm/bin"
export CDPATH="~/Code"

# Prevent duplicates and common history across sessions
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

export GIT_PS1_SHOWDIRTYSTATE=Y

export EDITOR=vim
