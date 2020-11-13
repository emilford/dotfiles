function git --wraps hub --description "Wrap git to provide extra functionality with GitHub."
  if test $PWD = $HOME
    hub --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
  else
    hub $argv
  end
end

