function dotfiles -w git -d "Interact with dotfiles bare repo"
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
end

