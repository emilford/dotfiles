Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

nnoremap <c-p> :Files<CR>

let g:fzf_layout = { 'down': '~20%' }

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
