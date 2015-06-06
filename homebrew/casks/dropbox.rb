#!/usr/bin/env ruby

def main
  homebrew_install_cask("dropbox")
  remove_dropbox_checkmark_icons
end

def remove_dropbox_checkmark_icons
  path_to_icons
  %w(
    emblem-dropbox-uptodate.icns
    emblem-dropbox-selsync.icns
    emblem-dropbox-syncing.icns
    emblem-dropbox-unsyncable.icns
  ).each do |icon|
    original_file = "#{path_to_icons}/#{icon}"

    if File.exists?(original_file)
      File.rename(original_file, "#{original_file}.bak")
    end
  end

end

def path_to_icons
  "/opt/homebrew-cask/Caskroom/dropbox/latest/Dropbox.app/Contents/Resources"
end

main
