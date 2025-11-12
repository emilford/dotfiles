set -e

trap 'echo "The installation failed! You can retry by running: source $HOME/.install.sh"' ERR

if [ ! -d "$HOME/.dotfiles" ]; then
  echo "Cloning repository..."
  git clone --separate-git-dir=$HOME/.dotfiles git@github.com:emilford/dotfiles.git $HOME/.dotfiles-tmp
  rm -r ~/.dotfiles-tmp
  git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout .
  git config set --local core.worktree $HOME
fi

echo "Installation starting..."

source $HOME/.install/utils.sh

run_as_sudo

source $HOME/.install/fish.sh
source $HOME/.install/brew.sh
source $HOME/.install/neovim.sh
