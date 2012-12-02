if [ -d ~/Development ]; then
  for directory in $(ls ~/Development); do
    alias $directory="cd ~/Development/$directory"
  done
fi
