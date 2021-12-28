function nvim --wraps nvim --description "Wrap nvim to handle dotfiles bare repo"
  if test $PWD = $HOME
    GIT_DIR=$HOME/.dotfiles command nvim $argv
  else
    command nvim $argv
  end
end
