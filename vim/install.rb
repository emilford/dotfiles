#!/usr/bin/env ruby

load File.expand_path("../../install.rb", __FILE__)

def main
  header "Vim"

  symlink("~/Code/dotfiles/vim", "~/.vim")
  run("git submodule update --init --recursive")
  run("vim +PluginInstall +qall", "Vim install plugins")

  run("mkdir ~/.config")
  symlink("~/Code/dotfiles/vim", "~/.config/nvim")
  symlink("~/Code/dotfiles/vim/vimrc", "~/.config/nvim/init.vim")
end

main
