function cd () { builtin cd "$@" && echo -e "\033];`basename $PWD`\007"; }
