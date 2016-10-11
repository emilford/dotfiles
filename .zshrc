source <(antibody init)

autoload -U compinit
compinit -u

for file in $HOME/.zsh/rcplugins/*.zsh; do            # load plugins
  source $file
done

for file in $HOME/.zsh/rcfiles/*.zsh; do              # load configurations
  source $file
done

setopt NO_NOMATCH # fix extendedglob clashing with git's ^

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
source /usr/local/share/chruby-default-gems.sh

unsetopt correct
setopt nocorrectall

unsetopt ignoreeof # do not require logout to close shell, ^D is fine
setopt auto_cd
cdpath=(. $HOME/Code)
# export CDPATH=".:~/Code"
export EDITOR="vim"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
# export PATH="./bin:$HOME/.bin:/usr/local/bin:$PATH"
eval "$(hub alias -s)"

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
    # for i in $session_names; do
    #   # printf "[%s] %s  " "$((i+1))" "${session_names[$i]}"
    #   printf "[%s] %s" "f" "${i}"
    # done

    printf "\nEnter the number of the tmux session to join: "

    read session

    exec tmux -S ~/.tmux.socket attach -t ${session_names[$((session))]}
  fi
fi
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
