Plugin 'junegunn/fzf.vim'

nnoremap <silent> <C-p> :Files<cr>

let g:fzf_layout = { 'up': '12' } " Position the default fzf window layout
let g:fzf_action = { 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }
