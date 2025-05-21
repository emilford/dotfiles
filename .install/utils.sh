function run_as_sudo {
  sudo -v

  while true; do
    sudo -v
    sleep 60
  done &

  SUDO_PID=$!
  echo $SUDO_PID

  trap 'kill $SUDO_PID' EXIT
}

function with_logging {
  printf "$@" | tee -a install.out
}

function header {
  with_logging "\n%s\n%s\n" "$1" "________________________________________"
}

function message {
  with_logging "%-100s" "$1"
}

function noop {
  message "$1"
  success
}

function failure {
  with_logging '\e[1;31m%s\e[m\n' "✖"
}

function success {
  with_logging '\e[1;32m%s\e[m\n' "✔"
}

function cmd {
  local command=$1

  eval "$command" >> install.out 2>&1
}

function run {
  local message=$1
  local command=$2

  message "$message"
  cmd "$command"

  if [ $? != 0 ]; then
    failure
  else
    success
  fi
}
