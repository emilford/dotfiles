header "macos"

run "osascript -e 'tell application \"System Preferences\" to quit'" "osascript -e 'tell application \"System Preferences\" to quit'"

run "defaults write NSGlobalDomain _HIHideMenuBar -bool true" "defaults write NSGlobalDomain _HIHideMenuBar -bool true"

run "defaults write com.apple.dock autohide -bool true" "defaults write com.apple.dock autohide -bool true"
run "defaults write com.apple.dock largesize -int 128" "defaults write com.apple.dock largesize -int 128"
run "defaults write com.apple.dock magnification -bool true" "defaults write com.apple.dock magnification -bool true"
run "defaults write com.apple.dock minimize-to-application -bool true" "defaults write com.apple.dock minimize-to-application -bool true"
run "defaults write com.apple.dock mru-spaces -bool false" "defaults write com.apple.dock mru-spaces -bool false"
run "defaults write com.apple.dock persistent-apps -array" "defaults write com.apple.dock persistent-apps -array"
run "defaults write com.apple.dock persistent-others -array" "defaults write com.apple.dock persistent-others -array"
run "defaults write com.apple.dock show-recents -bool false" "defaults write com.apple.dock show-recents -bool false"
run "defaults write com.apple.dock tilesize -int 23" "defaults write com.apple.dock tilesize -int 23"

run "defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false" "defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false"
run "defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false" "defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false"
run "defaults write com.apple.finder ShowMountedServersOnDesktop -bool false" "defaults write com.apple.finder ShowMountedServersOnDesktop -bool false"
run "defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false" "defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false"
