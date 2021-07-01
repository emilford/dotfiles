function vim --wraps vim --description "Wrap vim to handle dotfiles bare repo"
  if test $PWD = $HOME
    GIT_DIR=$HOME/.dotfiles command vim $argv
  else
    command vim $argv
  end
end
