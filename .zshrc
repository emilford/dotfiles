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
setopt PROMPT_SUBST
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
export RPROMPT=$'%c $(git_info)'

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
source /usr/local/share/chruby-default-gems.sh
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
  $(ssh-agent tmux -S ~/.tmux.socket new -s ${1-${PWD##*/}})
}

function ta () {
  $(tmux -S ~/.tmux.socket attach -t ${1-${PWD##*/}})
}

function tk () {
  $(tmux -S ~/.tmux.socket kill-session -t ${1-${PWD##*/}})
}

function ts () {
  $(tmux -S ~/.tmux.socket switch -t ${1-${PWD##*/}})
}

git_info() {
  if git_dir &>/dev/null; then
    echo "$(current_branch)$(rebase_info)$(repo_dirty)$(needs_push)$(current_sha)"
  fi
}

current_branch() {
  local branch_name="$(current_branch_name)"

  if [ "$branch_name" = "HEAD" ]; then
    echo "%{$fg[red]%}DETACHED%{$reset_color%}"
  else
    echo "%{$fg[blue]%}$branch_name%{$reset_color%}"
  fi
}

current_sha() {
  echo " %{$fg[yellow]%}$(git rev-parse --short HEAD)%{$reset_color%}"
}

rebase_info() {
  local git_dir="$(git_dir)"

  if [ -f "$git_dir/BISECT_LOG" ]; then
    echo "+bisect"
  elif [ -f "$git_dir/MERGE_HEAD" ]; then
    echo "+merge"
  else
    for file in rebase rebase-apply rebase-merge; do
      if [ -e "$git_dir/$file" ]; then
        echo "+rebase ↕↓"
        break
      fi
    done
  fi
}

repo_dirty() {
  if [[ ! $(git status 2>/dev/null) =~ "directory clean" ]]; then
    echo " %{$fg[red]%}∗%{$reset_color%}"
  fi
}

needs_push() {
  if [[ -n "$(git cherry -v origin/em-$(current_branch_name) 2>/dev/null)" ]]; then
    echo " %{$fg[red]%}↑%{$reset_color%} "

  fi
}

current_branch_name() {
  git rev-parse --abbrev-ref HEAD
}

git_dir() {
  git rev-parse --git-dir 2>/dev/null
}
