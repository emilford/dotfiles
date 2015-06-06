#!/usr/bin/env ruby

def main
  homebrew_install_cask("slack")
  dock_add_icon(app_name: "Slack", position: 5)
end

main
