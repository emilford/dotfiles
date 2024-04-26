function latest --description "Update all the things"
    asdf update && asdf plugin update --all
    brew update && brew upgrade
    gh extension upgrade --all
    npm update --location=global
    tldr --update
    vale sync
    fisher update
end
