cd .

source ~/.git_completion
source ~/.bash_colors
source ~/.aliases


__rvm-prompt()
{
  local g="$(rvm-prompt)"
  if [ -n "$g" ]; then
    echo "[$g]"
  fi
}


export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend
export GIT_PS1_SHOWDIRTYSTATE=Y

# Custom prompt w/ git branch name
PS1='\n\[\033[0m\]\T [lira:\w]\033[1;36m\]$(__rvm-prompt)\[\033[00;35m\]$(__git_ps1 "[%s]")\[\033[00m\]\n\$ '

PATH=$PATH:./bin
