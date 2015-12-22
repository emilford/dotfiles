
#!/usr/bin/env ruby

load File.expand_path("../../install.rb", __FILE__)

def main
  header("Ruby")

  symlink("~/Code/dotfiles/ruby/bundle", "~/.bundle")
  symlink("~/Code/dotfiles/ruby/default-ruby-gems", "~/.default-ruby-gems")
  symlink("~/Code/dotfiles/ruby/gemrc", "~/.gemrc")
  symlink("~/Code/dotfiles/ruby/rspec", "~/.rspec")
  symlink("~/Code/dotfiles/ruby/ruby-version", "~/.ruby-version")

  ruby_install_version("2.2.4")
  ruby_install_version("2.2.3")
  run("rm -rf ~/src")
end

def ruby_install_version(version)
  if ruby_version_installed?(version)
    success("ruby-install #{version}")
  else
    run("ruby-install ruby #{version}", "ruby-install #{version}")
  end
end

def ruby_version_installed?(version)
  Dir.exists?(File.expand_path("~/.rubies/ruby-#{version}"))
end

main
