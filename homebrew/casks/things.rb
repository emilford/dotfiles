#!/usr/bin/env ruby

def main
  homebrew_install_cask("things")
  dock_add_icon(app_name: "Things", position: 6)
end

main
