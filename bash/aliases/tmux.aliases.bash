alias tl='tmux -S /var/tmux/session list-sessions'
alias td='tmux -S /var/tmux/session detach'

function tn () {
  $(ssh-agent tmux -S /var/tmux/session new -s ${1-${PWD##*/}})
}

function ta () {
  $(tmux -S /var/tmux/session attach -t ${1-${PWD##*/}})
}

function tk () {
  $(tmux -S /var/tmux/session kill-session -t ${1-${PWD##*/}})
}

function ts () {
  $(tmux -S /var/tmux/session switch -t ${1-${PWD##*/}})
}
