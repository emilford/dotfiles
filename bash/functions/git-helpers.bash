pretty_git_log() {

  HASH="%C(yellow)%h%Creset"
  RELATIVE_TIME="%Cgreen(%ar)%Creset"
  AUTHOR="%C(cyan)<%an>%Creset"
  REFS="%C(red)%d%Creset"
  SUBJECT="%s"

  FORMAT="$HASH}$RELATIVE_TIME}$AUTHOR}$REFS $SUBJECT"

  git log --graph --pretty="tformat:${FORMAT}" $* |

      # Replace (2 years ago) with (2 years)
      sed -Ee 's/(^[^<]*) ago\)/\1)/' |

      # Replace (2 years, 5 months) with (2 years)
      sed -Ee 's/(^[^<]*), [[:digit:]]+ .*months?\)/\1)/' |

      # Line columns up based on } delimiter
      column -s '}' -t |

      # Page only if we need to
      less -FXRS
}