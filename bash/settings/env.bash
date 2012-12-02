export PATH="./bin:$HOME/.rbenv/bin:$PATH"

# Prevent duplicates and common history across sessions
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
