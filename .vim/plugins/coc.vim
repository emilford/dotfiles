Plug 'neoclide/coc.nvim', { 'branch': 'release' }

let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-highlight',
  \ 'coc-elixir',
  \ 'coc-emmet',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-marketplace',
  \ 'coc-prettier',
  \ 'coc-snippets',
  \ 'coc-solargraph',
  \ 'coc-styled-components',
  \ 'coc-tailwindcss',
  \ 'coc-tsserver',
  \ 'coc-vetur',
  \ 'coc-yaml',
  \ ]

let g:coc_filetype_map = {
  \ 'eruby': 'html',
  \ }

" vim-endwise configures a <cr> mapping that triggers vim-endwise behavior.
" These mappings have, however, been disabled in favoring of defining a <cr>
" mapping here that triggers both coc.vim completion selection and the desired
" vim-endwise behavior.
" See .vim/plugins/vim-endwise.vim
inoremap <expr> <Plug>CustomCocCR pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
imap <CR> <Plug>CustomCocCR<Plug>DiscretionaryEnd
