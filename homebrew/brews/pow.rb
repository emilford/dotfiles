#!/usr/bin/env ruby

if homebrew_install_brew("pow")
  pow_hosts_path = File.expand_path('~/Library/Application\ Support/Pow/Hosts')

  run("mkdir -p #{pow_hosts_path}")
  run("ln -s #{pow_hosts_path} ~/.pow")
  run("sudo pow --install-system")
  run("pow --install-local")
  run("sudo launchctl load -w /Library/LaunchDaemons/cx.pow.firewall.plist")
  run("launchctl load -w ~/Library/LaunchAgents/cx.pow.powd.plist")
end
