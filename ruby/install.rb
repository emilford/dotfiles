
#!/usr/bin/env ruby

load File.expand_path("../../install.rb", __FILE__)

def main
  header("Ruby")

  symlink("~/Code/dotfiles/ruby/bundle", "~/.bundle")
  symlink("~/Code/dotfiles/ruby/default-ruby-gems", "~/.default-ruby-gems")
  symlink("~/Code/dotfiles/ruby/gemrc", "~/.gemrc")
  symlink("~/Code/dotfiles/ruby/rspec", "~/.rspec")
  symlink("~/Code/dotfiles/ruby/ruby-version", "~/.ruby-version")

  run("ruby-install ruby 2.2.4", "Ruby install 2.2.4")
  run("ruby-install ruby 2.2.3", "Ruby install 2.2.3")
  run("rm -rf ~/src")
end

main
