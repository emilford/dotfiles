#!/usr/bin/env ruby

require "open3"
require "mkmf"

def main
  run("git submodule update --init --recursive", false)

  header("symlinks")

  symlink("agignore")
  symlink("bash_profile")
  symlink("bin")
  symlink("bundle")
  symlink("config")
  symlink("default-ruby-gems")
  symlink("gemrc")
  symlink("gitconfig")
  symlink("gitignore")
  symlink("gittemplate")
  symlink("hushlogin")
  symlink("rspec")
  symlink("ruby-version")
  symlink("ssh")
  symlink("tmux.conf")
  symlink("vim")


  header("homebrew")

  homebrew_install
  run("brew update")
  run("brew upgrade")
  run("brew tap homebrew/versions")
  run("brew tap neovim/neovim")
  run("brew tap caskroom/versions")
  homebrew_install_brew("bash")
  homebrew_install_brew("bash-completion2")
  homebrew_install_brew("caskroom/cask/brew-cask")
  homebrew_install_brew("chruby")
  homebrew_install_brew("https://raw.github.com/bronson/chruby-default-gems/master/homebrew/chruby-default-gems.rb --HEAD", "brew install chruby-default-gems")
  homebrew_install_brew("ctags")
  homebrew_install_brew("git")
  homebrew_install_brew("heroku-toolbelt")
  homebrew_install_brew("--HEAD neovim", "brew install neovim")
  homebrew_install_brew("postgresql")
  homebrew_install_brew("pow")
  homebrew_install_brew("reattach-to-user-namespace")
  homebrew_install_brew("redis")
  homebrew_install_brew("rename")
  homebrew_install_brew("ruby-install")
  homebrew_install_brew("the_silver_searcher")
  homebrew_install_brew("https://raw.githubusercontent.com/choppsv1/homebrew-term24/master/tmux.rb", "brew install tmux")
  homebrew_install_brew("tree")
  homebrew_install_brew("vim")
  homebrew_install_cask("1password")
  homebrew_install_cask("bittorrent-sync")
  homebrew_install_cask("dropbox")
  homebrew_install_cask("firefox")
  homebrew_install_cask("google-chrome")
  homebrew_install_cask("harvest")
  homebrew_install_cask("iterm2-nightly")
  homebrew_install_cask("macpass")
  homebrew_install_cask("sizeup")
  homebrew_install_cask("skype")
  homebrew_install_cask("slack")
  homebrew_install_cask("stay")
  homebrew_install_cask("things")
  homebrew_install_cask("transmission")
  homebrew_install_cask("vlc")
  homebrew_install_cask("ynab")
  run("brew cleanup")
  run("brew cask cleanup")

  header("rubies")

  ruby_install_version("2.2.4")
  ruby_install_version("2.2.3")
  run("rm -rf ~/src", false)


  header("configure")

  run("sudo -v", false)

  Dir.entries("configure").each do |file|
    next if file == "." or file == ".."
    run("sh configure/#{file}", "configure #{file}")
  end

  run("brew install dockutil", false)
  run("dockutil --remove all", false)
  dock_add_icon("Safari", 1)
  dock_add_icon("Mail", 2)
  dock_add_icon("Messages", 3)
  dock_add_icon("iTerm", 4)
  dock_add_icon("Slack", 5)
  dock_add_icon("Things", 6)
  run("brew uninstall dockutil", false)
end

def header(text)
  printf "\n%s\n", text
  printf "%s\n\n", "========================================"
end

def success
  printf "[ \033[ 00;32m✔\033[0m ]\n"
end

def failure
  printf "[ \033[ 00;31m✔\033[0m ]\n"
end

def symlink(file)
  old = File.expand_path(file)
  new = File.expand_path("~/.#{file}")

  running(new)

  if File.symlink?(new)
    File.unlink(new)
  end

  File.symlink(old, new)

  success
end

def running(text)
  printf "%-100s", text
end

def run(command, message = nil, hide_failure = false)

  message = message.nil? ? command : message

  if message
    running(message)
  end

  Open3.capture3(command).tap do |stdout, stderr, status|
    if status.success? || hide_failure
      if message
        success
      end
    else
      if message
        failure
      else
        running(command)
        failure
      end
    end
  end
end

def ruby_install_version(version)
  if ruby_version_installed?(version)
    running("ruby-install #{version}")
    success
  else
    run("ruby-install ruby #{version}", "ruby-install #{version}")
  end
end

def ruby_version_installed?(version)
  Dir.exists?(File.expand_path("~/.rubies/ruby-#{version}"))
end

def homebrew_install
  if homebrew_installed?
    running("brew install")
    success
  else
    run(
      %(
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      ),
      "brew install"
    )
  end
end

def homebrew_install_brew(brew, message = nil)
  if homebrew_brew_installed?(brew)
    running(message || "brew install #{brew}")
    success
  else
    run("brew install #{brew}", message)
  end
end

def homebrew_install_cask(cask, message = nil)
  if homebrew_cask_installed?(cask)
    running(message || "brew cask install #{cask}")
    success
  else
    run("brew cask install --appdir=/Applications --force #{cask}", message)
  end
end

def homebrew_installed?
  find_executable0("brew")
end

def homebrew_brew_installed?(brew)
  stdout, _stderr, _status = run("brew ls --versions #{brew}", false)
  !stdout.empty?
end

def homebrew_cask_installed?(cask)
  _stdout, _stderr, status = run("brew cask list #{cask}", false, true)
  status.success?
end

def dock_add_icon(app_name, position)
  run("dockutil --add /Applications/#{app_name}.app " \
             "--replacing #{app_name} --position #{position}", "dock position ##{position} -> #{app_name}")
end

main
