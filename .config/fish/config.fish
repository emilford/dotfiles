set fish_greeting

set -gx PATH $HOME/.local/bin $PATH
set -gx PATH .git/safe/../../bin $PATH

set -x CDPATH $CDPATH $HOME/Code

abbr b  bundle
abbr be bundle exec
abbr bi bundle install
abbr bu bundle udpate

abbr ta tmux attach -t
abbr td tmux detach
abbr tk tmux kill-session -t
abbr tl tmux list-sessions
abbr tn tmux new -s

source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish
