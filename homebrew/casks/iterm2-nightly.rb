#!/usr/bin/env ruby

homebrew_install_cask("iterm2-nightly")
dock_add_icon("iTerm", 4)

run("defaults write com.googlecode.iterm2 PromptOnQuit -bool false")
