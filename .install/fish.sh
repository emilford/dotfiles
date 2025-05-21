header "fish"

if ! (cat /etc/shells | grep -q "fish" 2>/dev/null); then
  run "fish configure" 'echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells'
else
  noop "fish configure"
fi

if ! [[ $SHELL =~ /fish$/ ]]; then
  run "fish default shell" 'sudo chsh -s /opt/homebrew/bin/fish $(whoami)'
else
  noop "fish default shell"
fi

run "fish install plugins" "/opt/homebrew/bin/fish -c fisher update"
