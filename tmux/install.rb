#!/usr/bin/env ruby

load File.expand_path("../../install.rb", __FILE__)

def main
  symlink("~/Code/dotfiles/git/tmux.conf", "~/.tmux.conf")
end

main
