for f in `find ~/Code/dotfiles -name '*.ln'`; do
  filename=$(basename "$f")

  if [ ! -e "$HOME/.${filename%.ln}" ]; then
    ln -s $f "$HOME/.${filename%.ln}"
  fi
done
