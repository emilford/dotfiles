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

" Clear the search buffer when hitting return
nnoremap <leader><cr> :nohlsearch<cr>

" Shortcuts for commonly tabulars
map <leader>tj :Tabularize json<cr>
map <leader>t: :Tabularize first_colon<cr>
map <leader>th :Tabularize hash_rocket<cr>
map <leader>t= :Tabularize first_equals<cr>
map <leader>t' :Tabularize first_single_quote<cr>
map <leader>t" :Tabularize first_double_quote<cr>
map <leader>t{ :Tabularize first_left_stash<cr>
map <leader>t} :Tabularize first_right_stash<cr>
map <leader>t\| :Tabularize bar<cr>

" Shortcuts for ctrl-p
nmap <leader>ff  :CtrlP<cr>
nmap <leader>fa  :CtrlP app<cr>
nmap <leader>fm  :CtrlP app/models<cr>
nmap <leader>fc  :CtrlP app/controllers<cr>
nmap <leader>fv  :CtrlP app/views<cr>
nmap <leader>fh  :CtrlP app/helpers<cr>
nmap <leader>fp  :CtrlP app/presenters<cr>
nmap <leader>faj :CtrlP app/assets/javascripts<cr>
nmap <leader>fas :CtrlP app/assets/stylesheets<cr>
nmap <leader>fi  :CtrlP app/interactors<cr>
nmap <leader>fd  :CtrlP db<cr>
nmap <leader>fs  :CtrlP spec<cr>
nmap <leader>ft  :CtrlP test<cr>

" Vimux shortcuts
map <Leader>vq :CloseVimTmuxRunner<cr>
map <Leader>vi :InterruptVimTmuxRunner<cr>
map <Leader>vp :PromptVimTmuxCommand<cr>
map <Leader>vl :RunLastVimTmuxCommand<cr>

" Close all buffers
map <leader>bda :bufdo bd<cr>

" Edit project notes
map <leader>pn :vs project-notes.txt<cr>

" Edit coding notes
map <leader>cn :vs ~/Dropbox/coding-notes.txt<cr>

" Edit Vim notes
map <leader>vn :vs ~/Dropbox/vim-notes.txt<cr>

" Move to next/previous row instead of line
nnoremap j gj
nnoremap k gk
