function latest --description "Update all the things"
    brew update && brew upgrade
    gem update --system
    gh extension upgrade --all
    mise plugin update
    npm update --location=global
    tldr --update
    vale sync
    fisher update
end
