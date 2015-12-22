#!/usr/bin/env ruby

if homebrew_install_brew("bash")
  run("sudo bash -c 'echo /usr/local/Cellar/bash/4.3.42/bin/bash >> /etc/shells'")
  run("chsh -s /usr/local/Cellar/bash/4.3.42/bin/bash")
end
