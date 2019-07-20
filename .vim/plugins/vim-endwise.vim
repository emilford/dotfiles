Plug 'tpope/vim-endwise'

" vim-endwise configures a <cr> mapping that triggers vim-endwise behavior. This
" conflicts with using <cr> to trigger completion selection in coc.vim.
" Disabling the vim-endwise mappings here and configurating <cr> in coc.vim to
" trigger both the desired coc and vim-endwise behavior.
" See .vim/plugins/coc.vim
let g:endwise_no_mappings = v:true
