#!/usr/bin/env ruby

load File.expand_path("../../install.rb", __FILE__)

def main
  symlink("~/Code/dotfiles/git/gitignore", "~/.gitignore")
  symlink("~/Code/dotfiles/git/gittemplate", "~/.gittemplate")
  symlink("~/Code/dotfiles/git/gitconfig", "~/.gitconfig")
end

main
