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

" Clear the search buffer when hitting return except in quickfix window
nnoremap <CR> :noh<CR>
autocmd BufReadPost Quickfix nnoremap <buffer> <CR> <CR>

" Shortcuts for ctrl-p
nmap <c-p>f  :CtrlP<cr>
nmap <c-p>m  :CtrlP app/models<cr>
nmap <c-p>c  :CtrlP app/controllers<cr>
nmap <c-p>v  :CtrlP app/views<cr>
nmap <c-p>h  :CtrlP app/helpers<cr>
nmap <c-p>p  :CtrlP app/presenters<cr>
nmap <c-p>aj :CtrlP app/assets/javascripts<cr>
nmap <c-p>as :CtrlP app/assets/stylesheets<cr>
nmap <c-p>i  :CtrlP app/interactors<cr>
nmap <c-p>d  :CtrlP db<cr>
nmap <c-p>s  :CtrlP spec<cr>
nmap <c-p>t  :CtrlP test<cr>

" Close all buffers
nmap bda :bufdo bd<cr>

" Move to next/previous row instead of line
nnoremap j gj
nnoremap k gk

" Add support for text inside |
nnoremap di\| T\|d,
nnoremap da\| F\|d,
nnoremap ci\| T\|c,
nnoremap ca\| F\|c,
nnoremap yi\| T\|y,
nnoremap ya\| F\|y,
nnoremap vi\| T\|v,
nnoremap va\| F\|v,

" Add support for text inside :
nnoremap di: T:d,
nnoremap da: F:d,
nnoremap ci: T:c,
nnoremap ca: F:c,
nnoremap yi: T:y,
nnoremap ya: F:y,
nnoremap vi: T:v,
nnoremap va: F:v,

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
