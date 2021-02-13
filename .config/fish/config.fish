set fish_greeting

abbr ta tmux attach -t
abbr td tmux detach
abbr tk tmux kill-session -t
abbr tl tmux list-sessions
abbr tn tmux new -s

source $HOME/.asdf/asdf.fish

eval (direnv hook fish)

set -x RIPGREP_CONFIG_PATH $HOME/.config/ripgrep/ripgreprc
