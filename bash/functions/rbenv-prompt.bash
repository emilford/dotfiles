__rbenv-prompt()
{
  local g="$(rbenv version-name)"
  if [ -n "$g" ]; then
    echo "[$g]"
  fi
}
