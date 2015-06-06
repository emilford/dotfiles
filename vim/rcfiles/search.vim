" Ignore search pattern case
set ignorecase

" Override ignorecase if the search pattern contains uppercase characters
set smartcase

" Highlight search pattern matches
set hlsearch

" Highlight search pattern matches as they're found
set incsearch

" Clear the search buffer when hitting return except in quickfix window
nnoremap <CR> :noh<CR>
autocmd BufReadPost Quickfix nnoremap <buffer> <CR> <CR>
