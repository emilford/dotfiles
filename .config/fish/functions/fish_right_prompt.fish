function fish_right_prompt --description "Write out the right prompt"
  set -g __fish_git_prompt_showupstream verbose
  set -g __fish_git_prompt_show_untracked_files 1
  set -g __fish_git_prompt_show_informative_status 1

  set -g __fish_git_prompt_char_cleanstate "✓"
  set -g __fish_git_prompt_char_conflictedstate "!"
  set -g __fish_git_prompt_char_dirtystate "+"
  set -g __fish_git_prompt_char_invalidstate  "×"
  set -g __fish_git_prompt_char_stagedstate "•"
  set -g __fish_git_prompt_char_untrackedfiles "◦"
  set -g __fish_git_prompt_char_upstream_ahead "↑"
  set -g __fish_git_prompt_char_upstream_behind "↓"
  set -g __fish_git_prompt_char_upstream_prefix " "

  set -g __fish_git_prompt_color_branch blue
  set -g __fish_git_prompt_color_cleanstate green
  set -g __fish_git_prompt_color_dirtystate red
  set -g __fish_git_prompt_color_invalidstate red --bold
  set -g __fish_git_prompt_color_stagedstate green
  set -g __fish_git_prompt_color_untrackedfiles magenta
  set -g __fish_git_prompt_color_prefix normal
  set -g __fish_git_prompt_color_suffix normal

  echo -n (basename (prompt_pwd))
  printf '%s ' (__fish_vcs_prompt)
end
