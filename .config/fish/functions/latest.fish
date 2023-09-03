function latest --description "Update all the things"
  asdf update && asdf plugin update --all
  brew update && brew upgrade
  npm update --location=global
  tldr --update
  vale sync
  bash ~/.config/tmux/plugins/tpm/bin/update_plugins all
  fisher update
end
