# .zshrc is for interactive shell configuration. You set options for the
# interactive shell there with the setopt and unsetopt commands. You can also
# load shell modules, set your history options, change your prompt, set up zle
# and completion, et cetera. You also set any variables that are only used in
# the interactive shell (e.g. $LS_COLORS).

alias b='bundle'
alias be='bundle exec'
alias bc='bundle check'
alias bi='bundle install'
alias bl='bundle list'
alias bu='bundle update'
alias bp='bundle package'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias tl='tmux -S ~/.tmux.socket list-sessions'
alias td='tmux -S ~/.tmux.socket detach'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=$HISTSIZE

path=(.git/safe/../../bin $HOME/.bin $path)
cdpath=(. $HOME/Code)

source <(antibody init)

antibody bundle zsh-users/zsh-completions
antibody bundle olivierverdier/zsh-git-prompt

autoload -U compinit && compinit -u
autoload -U colors && colors

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' insert-tab pending

setopt AUTO_CD
setopt COMPLETE_ALIASES
setopt COMPLETE_IN_WORD
setopt CORRECT
setopt EXTENDED_GLOB
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt IGNORE_EOF
setopt INC_APPEND_HISTORY
setopt LOCAL_OPTIONS
setopt LOCAL_TRAPS
setopt NOCORRECTALL
setopt NO_BG_NICE
setopt NO_HUP
setopt NO_LIST_BEEP
setopt NO_NOMATCH
setopt SHARE_HISTORY

unsetopt CORRECT
unsetopt IGNOREEOF

bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

prompt_opts=( cr subst percent )

export CLICOLOR=true
export EDITOR="vim"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export LSCOLORS="exfxcxdxbxegedabagacad"
export PROMPT='%(?.%F{green}.%F{red})→%f '
export RPROMPT=$'%c $(git_status)'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(hub alias -s)"

precmd () {print -Pn "\e]2; %~/ \a"}
preexec () {print -Pn "\e]2; %~/ \a"}

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  session_names=()
  while IFS=: read -r session_name _; do session_names+=("$session_name"); done < <(tmux -S ~/.tmux.socket list-sessions)

  if [[ "${#session_names[@]}" -eq 1 ]]
  then
    exec tmux -S ~/.tmux.socket attach -t ${session_names[1]}
  else
    for (( i = 1; i <= $#session_names; i++ )) do
      printf "[%s] %s  " "${i}" "${session_names[$i]}"
    done

    printf "\nEnter the number of the tmux session to join: "

    read session

    exec tmux -S ~/.tmux.socket attach -t ${session_names[$((session))]}
  fi
fi

function tn () {
  (ssh-agent tmux -S ~/.tmux.socket new -s ${1:-$(basename pwd)})
}

function ta () {
  (tmux -S ~/.tmux.socket attach -t ${1:-$(basename pwd)})
}

function tk () {
  (tmux -S ~/.tmux.socket kill-session -t ${1:-$(basename pwd)})
}

function ts () {
  (tmux -S ~/.tmux.socket switch -t ${1:-$(basename pwd)})
}

compdef g=git
function g {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status
  fi
}

function __tmux-sessions() {
  local expl
  local -a sessions
  sessions=( ${${(f)"$(command tmux -S ~/.tmux.socket list-sessions)"}/:[ $'\t']##/:} )
  _describe -t sessions 'sessions' sessions "$@"
}
compdef __tmux-sessions ta
compdef __tmux-sessions tk
compdef __tmux-sessions ts

git_status() {
	precmd_update_git_vars

  STATUS="%F{blue}$GIT_BRANCH%f"

  if [ "$GIT_BEHIND" -ne "0" ]; then
    STATUS="$STATUS %{↓%G%}$GIT_BEHIND%f"
  fi

  if [ "$GIT_AHEAD" -ne "0" ]; then
    if [ "$GIT_BEHIND" -eq "0" ]; then
      STATUS="$STATUS "
    fi
    STATUS="$STATUS%{↑%G%}$GIT_AHEAD%f"
  fi

  if [ "$GIT_CHANGED" -ne "0" ] ||
     [ "$GIT_CONFLICTS" -ne "0" ] ||
     [ "$GIT_STAGED" -ne "0" ] ||
     [ "$GIT_UNTRACKED" -ne "0" ]; then
    STATUS="$STATUS "
  fi

  if [ "$GIT_STAGED" -ne "0" ]; then
    STATUS="$STATUS%F{green}%{•%G%}$GIT_STAGED%f"
  fi

  if [ "$GIT_CONFLICTS" -ne "0" ]; then
    STATUS="$STATUS%F{red}%{!%G%}$GIT_CONFLICTS%f"
  fi

  if [ "$GIT_CHANGED" -ne "0" ]; then
    STATUS="$STATUS%F{red}%{+%G%}$GIT_CHANGED%f"
  fi

  if [ "$GIT_UNTRACKED" -ne "0" ]; then
    STATUS="$STATUS%F{magenta}%{◦%G%}$GIT_UNTRACKED%f"
  fi

  echo "$STATUS"
}

weather()
{
    curl -H "Accept-Language: ${LANG%_*}" wttr.in/"${1:-Washington,DC}"?u
}
