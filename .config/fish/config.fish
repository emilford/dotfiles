set fish_greeting

set -gx PATH $HOME/.local/bin $PATH
set -gx PATH .git/safe/../../bin $PATH

set -x CDPATH $CDPATH $HOME/Code

source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish
