Plug 'skwp/greplace.vim'

set grepprg=ag

let g:grep_cmd_opts = '--line-numbers --noheading'

nmap K *:Gsearch<cr>
vmap K *:Gsearch<cr>
