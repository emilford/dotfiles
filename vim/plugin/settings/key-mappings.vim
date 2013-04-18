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

" Map arrow keys to window resize
nmap <left>  <c-w><
nmap <right> <c-w>>
nmap <up>    <c-w>+
nmap <down>  <c-w>-

" Clear the search buffer when hitting return
nnoremap <cr> :nohlsearch<cr>

" Quick edit of .vimrc
map <leader>e :e ~/.vimrc<cr>

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

" Quick file rename
nmap <leader>rn :call RenameFile()<cr>

" Vimux shortcuts
map <Leader>vq :CloseVimTmuxRunner<cr>
map <Leader>vi :InterruptVimTmuxRunner<cr>
map <Leader>vp :PromptVimTmuxCommand<cr>
map <Leader>vl :RunLastVimTmuxCommand<cr>

" Remove all trailing whitespace
nnoremap <silent> <leader>kws :let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar>:nohl<cr>

" Close all buffers
map <leader>bda :bufdo bd<cr>

map <leader>n :NERDTreeToggle<cr>

" Fugitive shortcuts
nmap <leader>gs  :Gstatus<cr>
nmap <leader>gd  :Gdiff<cr>
nmap <leader>gl  :silent Glog!<cr>
nmap <leader>gll :silent Glog! --<cr>
nmap <leader>gc  :Gcommit<cr>
nmap <leader>gm  :Gmove 
nmap <leader>gr  :Gremove<cr>
nmap <leader>gR  :Gremove!<cr>
nmap <leader>gg  :silent Ggrep! 
map  <leader>go  :Gbrowse<cr>
map  <leader>gO  :Gbrowse!<cr>
map  <leader>gb  :Gblame<cr>

" Toggle Gundo window
nnoremap <leader>gu :GundoToggle<CR>

" Edit project notes
map <leader>pn :sp project-notes.txt<cr>

" Edit coding notes
map <leader>cn :sp ~/Dropbox/coding-notes.txt<cr>

" Search shortcuts via Ag
map <leader>s :Ag! 
map <leader>sf :AgFile! 
map <leader>sh :AgHelp! 

" Run bundle
map <leader>b :Bundle

" Dispatch! and Dispatch for asynchronously running commands
nmap <leader>d :DispatchRunCommand<cr>
nmap <leader>D :DispatchRunCommandBackground<cr>

" Toggle Quickfix and Location lists
nmap <script> <silent> <leader>q :call ToggleQuickfixList()<cr>
nmap <script> <silent> <leader>l :call ToggleLocationList()<cr>
