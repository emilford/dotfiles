cd .

source ~/.git_completion
source ~/.bash_colors
source ~/.aliases




export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend
export GIT_PS1_SHOWDIRTYSTATE=Y

# rbenv
#
__rbenv-prompt()
{
  local g="$(rbenv version-name)"
  if [ -n "$g" ]; then
    echo "[$g]"
  fi
}

PS1='\n\[\033[0m\]\T [lira:\w]\033[1;36m\]$(__rbenv-prompt)\[\033[00;35m\]$(__git_ps1 "[%s]")\[\033[00m\]\n\$ '

eval "$(rbenv init -)"

# RVM
#
# __rvm-prompt()
# {
#   local g="$(rvm-prompt)"
#   if [ -n "$g" ]; then
#     echo "[$g]"
#   fi
# }
#
# PS1='\n\[\033[0m\]\T [lira:\w]\033[1;36m\]$(__rvm-prompt)\[\033[00;35m\]$(__git_ps1 "[%s]")\[\033[00m\]\n\$ '
#
# [[ -s "/Users/Eric/.rvm/scripts/rvm" ]] && source "/Users/Eric/.rvm/scripts/rvm"

PATH=$PATH:./bin
