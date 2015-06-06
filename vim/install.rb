#!/usr/bin/env ruby

def main
  header "Vim"

  symlink(old_name: "vim", new_name: ".vim")
  vim_install_plugins
end

def vim_install_plugins
  run(
    command: "vim +PluginInstall +qall",
    message: "Vim install plugins"
  )
end

main
