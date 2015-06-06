#!/usr/bin/env ruby

def main
  header "Homebrew"

  homebrew_install
  homebrew_update
  homebrew_upgrade
  homebrew_install_brews
  homebrew_install_casks
  homebrew_cleanup
  homebrew_cask_cleanup
end

def homebrew_install
  if homebrew_installed?
    success("Homebrew install")
  else
    run(
      command: %(
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      ),
      message: "Homebrew install"
    )
  end
end

def homebrew_update
  run(
    command: "brew update",
    message: "Homebrew update",
  )
end

def homebrew_upgrade
  run(command: "brew upgrade", message: "Homebrew upgrade")
end

def homebrew_install_brews
  %w(
    bash
    bash-completion2
    caskroom/cask/brew-cask
    chruby
    ctags
    git
    heroku-toolbelt
    mysql
    phantomjs
    postgresql
    pow
    reattach-to-user-namespace
    redis
    rename
    ruby-install
    the_silver_searcher
    tmux
    tree
    vim
  ).each do |brew|
    homebrew_install_brew(brew)
  end
end

def homebrew_install_casks
  %w(
    awareness
    bittorrent-sync
    google-chrome
    harvest
    macpass
    rdio
    slack
    things
    vlc
    transmission
    ynab
  ).each do |cask|
    homebrew_install_cask(cask)
  end

  homebrew_install_casks_with_config
end

def homebrew_install_brew(brew)
  run(
    command: "brew install #{brew}",
    message: "Homebrew install brew #{brew}",
  )
end

def homebrew_install_cask(cask)
  if homebrew_cask_installed?(cask)
    success("Homebrew install cask #{cask}")
  else
    run(
      command: "brew cask install --appdir=/Applications --force #{cask}",
      message: "Homebrew install cask #{cask}"
    )
  end
end

def homebrew_brew_installed?(brew)
  stdout, _, _ = run(command: "brew ls --versions #{brew}")
end

def homebrew_cask_installed?(cask)
  _, _, status = run(command: "brew cask list #{cask}")
  status.success?
end

def homebrew_install_casks_with_config
  Dir["./homebrew/casks/*.rb"].each do |file|
    require(file)
  end
end

def homebrew_cleanup
  run(
    command: "brew cleanup",
    message: "Homebrew cleanup"
  )
end

def homebrew_cask_cleanup
  run(
    command: "brew cask cleanup",
    message: "Homebrew cask cleanup"
  )
end

def dock_add_icon(app_name:, position:)
  run(
    command: "dockutil --add /Applications/#{app_name}.app " \
             "--replacing #{app_name} --position #{position}"
  )
end

def homebrew_installed?
  executable_exists?("brew")
end

def executable_exists?(executable)
  # NOTE: Purposefully use this method to suppress output
  find_executable0(executable)
end

main
