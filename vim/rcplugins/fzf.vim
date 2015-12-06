Plugin 'junegunn/fzf.vim'

nnoremap <silent> <C-p> :Files<cr>

let g:fzf_layout = { 'up': '12' } " Position the default fzf window layout
" autocmd VimEnter * command! Colors
"   \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'})
