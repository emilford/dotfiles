if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  session_names=()
  while IFS=: read -r session_name _; do session_names+=("$session_name"); done < <(tmux -S /var/tmux/session list-sessions)

  for i in "${!session_names[@]}"; do
    printf "[%s] %s  " "$((i+1))" "${session_names[$i]}"
  done

  printf "\nEnter the number of the tmux session to join: "

  read session

  exec tmux -S /var/tmux/session attach -t ${session_names[$((session-1))]}
fi
