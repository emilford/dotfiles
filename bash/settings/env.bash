export PATH="./bin:$HOME/.bin:/usr/local/bin:$PATH"
export CDPATH="~/Code"

# Prevent duplicates and common history across sessions
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

export GIT_PS1_SHOWDIRTYSTATE=Y

export EDITOR="nvim"

export NVIM_TUI_ENABLE_TRUE_COLOR="1"
