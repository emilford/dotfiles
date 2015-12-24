
#!/usr/bin/env ruby

load File.expand_path("../../install.rb", __FILE__)

def main
  header("OS X")

  Dir.glob(File.expand_path("../../osx/**/*", __FILE__)).each do |file|
    next if file[/\.rb$/]
    run("sh #{file}")
  end

  ["Activity, Monitor", "Address, Book", "Calendar", "Contacts", "cfprefsd",
    "Dock", "Finder", "Google, Chrome", "Google, Chrome, Canary", "Mail", "Messages",
    "Opera", "Safari", "SizeUp", "Spectacle", "SystemUIServer", "Terminal",
    "Transmission", "Tweetbot", "Twitter", "iCal"].each do |app|
      run("killall \"${app}\" &> /dev/null")
  end
end

main
