alias b='bundle'
alias be='bundle exec'
alias bc='bundle check'
alias bi='bundle install'
alias bl='bundle list'
alias bu='bundle update'
alias bp='bundle package'

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

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
