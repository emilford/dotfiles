" Window navigation shortcuts
nmap <c-j> <c-w><c-j>
nmap <c-k> <c-w><c-k>
nmap <c-h> <c-w><c-h>
nmap <c-l> <c-w><c-l>

" Map arrow keys to window resize
nmap <left>  <c-w><
nmap <right> <c-w>>
nmap <up>    <c-w>+
nmap <down>  <c-w>-

" Automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Zoom current window
nnoremap <c-w>[ :wincmd _<cr>:wincmd \|<cr>

" De-zoom current window
nnoremap <c-w>] :wincmd =<cr>
