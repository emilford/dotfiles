function fish_prompt --description "Write out the prompt"
  set -l last_status $status

  if not test $last_status -eq 0
    set_color $fish_color_error
  end

  echo -n "→ "

  set_color normal
end
