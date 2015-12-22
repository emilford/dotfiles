#!/usr/bin/env ruby

require "open3"
require "mkmf"
#require "pry"

def failed_commands
  @failed_commands ||= []
end

def header(text)
  printf "\n%s\n", text
  printf "%s\n\n", "========================================"
end

def success(text)
  printf "\033[2K[ \033[00;32m✔\033[0m ] %s\n", text
end

def failure(text)
  printf "\033[2K[ \033[0;31m✖\033[0m ] %s\n", text
end

def symlink(old, new)
  old = File.expand_path(old)
  new = File.expand_path(new)

  if File.symlink?(new)
    File.unlink(new)
  end

  File.symlink(old, new)

  success("Symlink #{old} to #{new}")
end

def run(command, message = nil)
  Open3.capture3(command).tap do |stdout, stderr, status|
    if status.success?
      if message
        success(message)
      end
    else
      if message
        failure(message)
      end

      failed_commands << [command, stdout, stderr, status]
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  require_relative "./git/install.rb"
  require_relative "./homebrew/install.rb"
  require_relative "./vim/install.rb"
end
