cd .

source ~/.git_completion
source ~/.bash_colors
source ~/.aliases
source ~/.functions

shopt -s histappend

export HISTCONTROL=erasedups
export HISTSIZE=10000
export GIT_PS1_SHOWDIRTYSTATE=Y
export EDITOR='vim'
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

PS1='\n\[\033[0m\]\T [lira:\w]\033[1;36m\]$(__rbenv-prompt)\[\033[00;35m\]$(__git_ps1 "[%s]")\[\033[00m\]\n\$ '

eval "$(rbenv init -)"

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator && source $HOME/.tmuxinator/scripts/tmuxinator_completion

PATH=/usr/local/bin:$PATH:./bin
