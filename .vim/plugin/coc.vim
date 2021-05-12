let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-diagnostic',
  \ 'coc-html',
  \ 'coc-highlight',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-marketplace',
  \ 'coc-prettier',
  \ 'coc-snippets',
  \ 'coc-tailwindcss',
  \ 'coc-tsserver',
  \ ]

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

command! -nargs=0 Format :call CocAction('format')
