header "brew"

if [[ $(command -v brew) == "" ]]; then
  run "brew install" '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
else
  noop "brew install"
fi

run "brew bundle" "/opt/homebrew/bin/brew bundle --file=$HOME/.brewfile"
