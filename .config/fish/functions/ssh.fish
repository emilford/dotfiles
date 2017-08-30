function ssh --wraps ssh --description "Add fuzzy finding to ssh"
  if test -n "$argv"
    command ssh $argv
  else
    ag '^host [^*]' ~/.ssh/config | cut -d ' ' -f 2 | fzf | xargs -o ssh
  end
end
