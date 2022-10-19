function latest --description "Update all the things"
  asdf update && asdf plugin update --all
  brew update && brew upgrade
  npm update --location=global
  tldr --update
  vale sync
end
