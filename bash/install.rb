#!/usr/bin/env ruby

load File.expand_path("../../install.rb", __FILE__)

def main
  header("Bash")

  symlink("~/Code/dotfiles/bash/agignore", "~/.agignore")
  symlink("~/Code/dotfiles/bash/bash_profile", "~/.bash_profile")
  symlink("~/Code/dotfiles/bash/hushlogin", "~/.hushlogin")
end

main
