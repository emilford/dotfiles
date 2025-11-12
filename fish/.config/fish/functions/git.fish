function git --wraps git --description "Wrap git to handle dotfiles bare repo"
  if test $PWD = $HOME
    command git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
  else
    command git $argv
  end
end
