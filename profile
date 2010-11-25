source ~/.git-completion.sh
source ~/.aliases

export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend
export GIT_PS1_SHOWDIRTYSTATE=Y

# Custom prompt w/ git branch name
PS1='\n\[\033[0m\]\T [lira:\w]\[\033[00;35m\]$(__git_ps1 "[%s]")\[\033[00m\]\n\$ '
PS2="\[\033[0;31m\]\n> \[\033[0m\]"

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/git/bin:/usr/local/mongodb/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Use macvim to edit commit messages
export EDITOR='mvim -f -c "au VimLeave * !open -a Terminal"'

##
# Your previous /Users/Eric/.profile file was backed up as /Users/Eric/.profile.macports-saved_2010-11-17_at_13:54:49
##

# MacPorts Installer addition on 2010-11-17_at_13:54:49: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

