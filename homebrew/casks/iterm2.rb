#!/usr/bin/env ruby

def main
  homebrew_install_cask("iterm2")
  dock_add_icon(app_name: "iTerm", position: 4)
  disable_prompt_on_quit
  set_default_font
end

def disable_prompt_on_quit
  run(
    command: %(
      defaults write com.googlecode.iterm2 PromptOnQuit -bool false
    )
  )
end

def set_default_font
  run(
    command: %(
      /usr/libexec/PlistBuddy -c "Set :\"New Bookmarks\":0:\"Non Ascii Font\" Monaco 14" ~/Library/Preferences/com.googlecode.iterm2.plist
    )
  )

  run(
    command: %(
      /usr/libexec/PlistBuddy -c "Set :\"New Bookmarks\":0:\"Normal Font\" Monaco 14" ~/Library/Preferences/com.googlecode.iterm2.plist
    )
  )
end

main
