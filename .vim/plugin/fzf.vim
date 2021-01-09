nnoremap <c-p> :Files<CR>

let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95 } }
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow'
