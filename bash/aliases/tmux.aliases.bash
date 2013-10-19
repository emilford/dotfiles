alias tl='tmux -S ~/.tmux.socket list-sessions'
alias td='tmux -S ~/.tmux.socket detach'

function tn () {
  $(ssh-agent tmux -S ~/.tmux.socket new -s ${1-${PWD##*/}})
}

function ta () {
  $(tmux -S ~/.tmux.socket attach -t ${1-${PWD##*/}})
}

function tk () {
  $(tmux -S ~/.tmux.socket kill-session -t ${1-${PWD##*/}})
}

function ts () {
  $(tmux -S ~/.tmux.socket switch -t ${1-${PWD##*/}})
}
