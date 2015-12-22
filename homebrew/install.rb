#!/usr/bin/env ruby

load File.expand_path("../../install.rb", __FILE__)

def main
  run("sudo -v")
  header "Homebrew"

  homebrew_install

  run("brew update", "Homebrew update")
  run("brew upgrade", "Homebrew upgrade")

  run("brew tap homebrew/versions", "Homebrew tapped homebrew/versions")
  run("brew tap neovim/neovim", "Homebrew tapped neovim/neovim")
  run("brew tap caskroom/versions", "Homebrew tapped caskroom/versions")

  Dir.glob(File.expand_path("../../homebrew/brews/*.rb", __FILE__)).each do |file|
    load(file)
  end

  run("dockutil --remove all")

  Dir.glob(File.expand_path("../../homebrew/casks/*.rb", __FILE__)).each do |file|
    load(file)
  end

  run("brew cleanup", "Homebrew cleanup")
  run("brew cask cleanup", "Homebrew cask cleanup")
end

def homebrew_install
  if homebrew_installed?
    success("Homebrew install")
  else
    run(
      %(
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      ),
      "Homebrew install"
    )
  end
end

def homebrew_install_brew(brew)
  if homebrew_brew_installed?(brew)
    success("Homebrew install brew #{brew}")
    false
  else
    run("brew install #{brew}", "Homebrew install brew #{brew}")
    true
  end
end

def homebrew_install_cask(cask)
  if homebrew_cask_installed?(cask)
    success("Homebrew install cask #{cask}")
    false
  else
    run("brew cask install --appdir=/Applications --force #{cask}", "Homebrew install cask #{cask}")
    true
  end
end

def homebrew_installed?
  find_executable0("brew")
end

def homebrew_brew_installed?(brew)
  stdout, _stderr, _status = run("brew ls --versions #{brew}")
  !stdout.empty?
end

def homebrew_cask_installed?(cask)
  _stdout, _stderr, status = run("brew cask list #{cask}")
  status.success?
end

def dock_add_icon(app_name, position)
  run("dockutil --add /Applications/#{app_name}.app " \
             "--replacing #{app_name} --position #{position}")
end

main
