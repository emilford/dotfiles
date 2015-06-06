#!/usr/bin/env ruby

require "open3"
require "mkmf"
require "pry"

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

def symlink(old_name:, new_name:)
  link_from = "#{Dir.pwd}/#{old_name}"
  link_to = "#{Dir.home}/#{new_name}"

  File.unlink(link_to) if File.symlink?(link_to)
  File.symlink(link_from, link_to)

  success("Symlink #{link_from} to #{link_to}")
end

def run(command:, message: nil)
  Open3.capture3("#{command}").tap do |stdout, stderr, status|
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

require_relative "./homebrew/install.rb"
require_relative "./vim/install.rb"
