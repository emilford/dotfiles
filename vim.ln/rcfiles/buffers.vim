" Enable backgrounding buffers
set hidden

" Jump to existing buffer when available
set switchbuf=useopen

" Source .vimrc on save
autocmd! bufwritepost ~/.vimrc  source ~/.vimrc

" Close all buffers
nmap bda :bufdo bd<cr>
