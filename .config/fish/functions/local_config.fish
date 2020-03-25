function local_config --on-variable PWD --description 'source local fish config'
  if test -f .config.fish
    source .config.fish
  end
end
