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



" Plug 'andys8/vscode-jest-snippets'
" Plug 'rubyide/vscode-ruby'

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Show all diagnostics
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
" " Manage extensions
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
" " Show commands
nnoremap <silent> <space>c :<C-u>CocList commands<cr>
" " Find symbol of current document
nnoremap <silent> <space>o :<C-u>CocList outline<cr>
" " Search workspace symbols
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
nnoremap <silent> <space>j :<C-u>CocNext<CR>
" " Do default action for previous item.
nnoremap <silent> <space>k :<C-u>CocPrev<CR>
" " Resume latest coc list
nnoremap <silent> <space>p :<C-u>CocListResume<CR>
" nmap <leader>rn <Plug>(coc-rename)
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" set shortmess+=c

" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" " inoremap <expr> <TAB> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<TAB>"

" " show documentation
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" " show error, otherwise documentation, on hold
" function! ShowDocIfNoDiagnostic(timer_id)
"   if (coc#util#has_float() == 0)
"     silent call CocActionAsync('doHover')
"   endif
" endfunction

" function! s:show_hover_doc()
"   call timer_start(200, 'ShowDocIfNoDiagnostic')
" endfunction

" autocmd CursorHoldI * :call <SID>show_hover_doc()
" autocmd CursorHold * :call <SID>show_hover_doc()
