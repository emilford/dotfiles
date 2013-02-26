alias tnp='ssh-agent tmux -S /tmp/pair new -s pair && chmod 777 /tmp/pair'
alias tap='tmux -S /tmp/pair attach -t pair'
alias tsp='tmux -S /tmp/pair switch -t pair'
alias tkp='tmux -S /tmp/pair kill-session -t pair'
alias tlp='tmux -S /tmp/pair list-sessions'
alias tdp='tmux -S /tmp/pair detach'

alias tn='ssh-agent tmux new -s `basename $PWD`'
alias ta='tmux attach -t `basename $PWD`'
alias ts='tmux switch -t'
alias tl='tmux list-sessions'
alias tk='tmux kill-session -t'
alias td='tmux detach'
