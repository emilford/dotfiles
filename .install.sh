#!/bin/bash

set -e

function main {

  run_as_sudo

  install_brew
  install_asdf
  install_plug
  install_iterm
  install_macos
  install_fish

}

function install_asdf {
  header "asdf"

  cmd "source /usr/local/opt/asdf/asdf.sh"

  asdf_plugin_add "elixir"   "https://github.com/asdf-vm/asdf-elixir.git"
  asdf_plugin_add "elm"      "https://github.com/vic/asdf-elm"
  asdf_plugin_add "golang"   "https://github.com/kennyp/asdf-golang"
  asdf_plugin_add "postgres" "https://github.com/smashedtoatoms/asdf-postgres"
  asdf_plugin_add "redis"    "https://github.com/smashedtoatoms/asdf-redis"
  asdf_plugin_add "ruby"     "https://github.com/asdf-vm/asdf-ruby.git"
  asdf_plugin_add "swift"    "https://github.com/fcrespo82/asdf-swift"

  run "asdf plugin-update: all" "asdf plugin-update --all"
  run "asdf install: all" "asdf install"
}

function asdf_plugin_add {
  if !(asdf plugin-list | grep -q "$1" 2>/dev/null); then
    run "asdf plugin-add: $1" "asdf plugin-add $1 $2"
  else
    run "asdf plugin-add: $1"
  fi
}

function install_brew {
  header "brew"

  if ! type brew > /dev/null 2>&1; then
    run "brew install" 'echo | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
  else
    noop "brew install"
  fi

  run "brew bundle" "brew bundle --file=$HOME/.brewfile"
}

function install_fish {
  header "fish"

  if ! (cat /etc/shells | grep -q "fish" 2>/dev/null); then
    run "fish configure" 'echo "/usr/local/bin/fish" | sudo tee -a /etc/shells'
  else
    noop "fish configure"
  fi

  if ! [[ $SHELL =~ /fish$/ ]]; then
    run "fish default shell" "sudo chsh -s /usr/local/bin/fish eric"
  else
    noop "fish default shell"
  fi
}

function install_iterm {
  header "iTerm"

  run "iterm configure preferences" "defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string ~/.config/iterm2"
  run "iterm load preferences" "defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true"
}

function install_macos {
  header "macOS"

  run "configure macOS" "sh ./.macos"
}

function install_plug {
  header "plug.vim"

  run "plug clone" "curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  run "plug vim install" "echo | vim +PlugInstall +qall"
}

function with_logging {
  printf "$@" | tee -a install.out
}

function header {
  with_logging "\n\n%s\n%s\n\n" "$1" "________________________________________"
}

function message {
  with_logging "%-100s" "$1"
}

function noop {
  message "$1"
  success
}

function failure {
  with_logging '\e[1;31m%s\e[m\n' "✖"
}

function success {
  with_logging '\e[1;32m%s\e[m\n' "✔"
}

function cmd {
  local command=$1

  eval "$command" >> install.out 2>&1
}

function run {
  local message=$1
  local command=$2

  message "$message"
  cmd "$command"

  if [ $? != 0 ]; then
    failure
  else
    success
  fi
}

function run_as_sudo {
  sudo -v

  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}

main