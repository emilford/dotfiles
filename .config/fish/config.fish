set fish_greeting

set -gx PATH $HOME/.local/bin $PATH
set -gx PATH .git/safe/../../bin $PATH

set -x CDPATH $CDPATH $HOME
set -x CDPATH $CDPATH $HOME/Code

set -x EDITOR vim

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

if test -n "$SSH_CLIENT" ; or test -n "$SSH_TTY"
  set sessions (tmux list-sessions -F "#{session_name}")

  for i in (seq (count $sessions))
    echo [$i] $sessions[$i]
  end

  read -p 'echo -n "Enter the number of the tmux session to join: "' -l selected

  exec tmux attach -t $sessions[$selected]
end
