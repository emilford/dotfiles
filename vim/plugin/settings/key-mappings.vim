" Shortcuts to toggle comments
nmap <leader>c \\\
vmap <leader>c \\
xmap <leader>c \\

" Show/hide line numbers
nmap <c-n> :set invnumber<cr>

" Window navigation shortcuts
nmap <c-j> <c-w><c-j>
nmap <c-k> <c-w><c-k>
nmap <c-h> <c-w><c-h>
nmap <c-l> <c-w><c-l>

" Disable arrow keys
nnoremap <left>  :echoe "use h"<cr>
nnoremap <right> :echoe "use l"<cr>
nnoremap <up>    :echoe "use k"<cr>
nnoremap <down>  :echoe "use j"<cr>

" Clear the search buffer when hitting return
nnoremap <cr> :nohlsearch<cr>

" Quick edit of .vimrc
map <leader>e :e ~/.vimrc<cr>
