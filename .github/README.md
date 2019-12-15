# dotfiles

## install

The technique consists of storing a git bare repository in a separate directory and an alias so that commands are run against that folder and any file within the home folder can be versioned with normal commands.

No extra tooling, no symlinks, files are tracked on a version control system, you can use different branches for different computers, you can replicate you configuration easily on new installation.

`git clone --separate-git-dir=$HOME/.dotfiles git@github.com:emilford/dotfiles.git $HOME/.dotfiles-tmp`

`rm -r ~/.dotfiles-tmp`

`alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`

`dotfiles checkout .`

`sh ~/.install.sh`
