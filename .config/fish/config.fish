set fish_greeting

eval (/opt/homebrew/bin/brew shellenv)

direnv hook fish | source

set -x FZF_CTRL_T_COMMAND "fd --type file --follow --hidden --exclude .git"
set -x FZF_DEFAULT_COMMAND $FZF_CTRL_T_COMMAND
set -x MANPAGER "nvim +Man!"
set -x RIPGREP_CONFIG_PATH $HOME/.config/ripgrep/ripgreprc
set -x VISUAL nvim

set theme (cat $HOME/.theme 2>/dev/null; or echo "light")
if test $theme = light
    fish_config theme choose "Rosé Pine Dawn"
else
    fish_config theme choose "Rosé Pine Moon"
end

fish_add_path -pP ".git/safe/../../bin"
fish_add_path -aP "$HOME/.local/share/nvim/mason/bin"
