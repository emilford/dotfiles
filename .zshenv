# Since .zshenv is always sourced, it often contains exported variables that
# should be available to other programs. For example, $PATH, $EDITOR, and $PAGER
# are often set in .zshenv. Also, you can set $ZDOTDIR in .zshenv to specify an
# alternative location for the rest of your zsh configuration.

# Configure chruby
#
if [ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh
  source /usr/local/share/chruby-default-gems.sh
fi
