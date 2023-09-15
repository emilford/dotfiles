set fish_greeting

abbr ta tmux attach -t
abbr td tmux detach
abbr tk tmux kill-session -t
abbr tl tmux list-sessions
abbr tn tmux new -s

eval (/opt/homebrew/bin/brew shellenv)

source $HOME/.asdf/asdf.fish

direnv hook fish | source

set -x FZF_CTRL_T_COMMAND "fd --type file --follow --hidden --exclude .git"
set -x FZF_DEFAULT_COMMAND $FZF_CTRL_T_COMMAND
set -x RIPGREP_CONFIG_PATH $HOME/.config/ripgrep/ripgreprc
set -x VISUAL "nvim"

fish_config theme choose "Rosé Pine Moon"

fish_add_path -pP ".git/safe/../../bin"
