set fish_greeting

contains $HOME/.local/bin $PATH
or set PATH $HOME/.local/bin $PATH

contains .git/safe/../../bin $PATH
or set PATH .git/safe/../../bin $PATH

set -gx CDPATH . $HOME $HOME/Code

set -x EDITOR vim

abbr b  bundle
abbr be bundle exec
abbr bi bundle install
abbr bu bundle update

abbr g git

abbr ta tmux attach -t
abbr td tmux detach
abbr tk tmux kill-session -t
abbr tl tmux list-sessions
abbr tn tmux new -s

direnv hook fish | source

source $HOME/.asdf/asdf.fish
source $HOME/.config/fish/nord.fish
source $HOME/.config/fish/functions/local_config.fish

if test -n "$SSH_CLIENT" ; or test -n "$SSH_TTY"
  set sessions (tmux list-sessions -F "#{session_name}")

  for i in (seq (count $sessions))
    echo [$i] $sessions[$i]
  end

  read -p 'echo -n "Enter the number of the tmux session to join: "' -l selected

  exec tmux attach -t $sessions[$selected]
end
