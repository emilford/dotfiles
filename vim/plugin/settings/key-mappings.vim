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

" Open routes.rb
map <leader>r  :e      config/routes.rb<cr>
map <leader>rs :split  config/routes.rb<cr>
map <leader>rv :vsplit config/routes.rb<cr>

" Open Gemfile
map <leader>gf  :e      Gemfile<cr>
map <leader>gfs :split  Gemfile<cr>
map <leader>gfv :vsplit Gemfile<cr>

" Quick file rename
nmap <leader>rf :call RenameFile()<cr>

" Vimux shortcuts
map <Leader>vq :CloseVimTmuxRunner<cr>
map <Leader>vi :InterruptVimTmuxRunner<cr>
map <Leader>vp :PromptVimTmuxCommand<cr>
map <Leader>vl :RunLastVimTmuxCommand<cr>
map <leader>vv :call UseVimux()<cr>

" Remove all trailing whitespace
nnoremap <silent> <leader>kws :let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar>:nohl<cr>

" Close all buffers
map <leader>bda :bufdo bd<cr>

map <leader>n :NERDTreeToggle<cr>

" format the entire file
nmap <leader>fef ggVG=

" Fugitive shortcuts
nmap <leader>gs  :Gstatus<cr>
nmap <leader>gd  :Gdiff<cr>
nmap <leader>gl  :Glog<cr>
nmap <leader>gll :Glog --<cr>
nmap <leader>gc  :Gcommit<cr>
nmap <leader>gm  :Gmove
nmap <leader>gr  :Gremove<cr>
nmap <leader>gR  :Gremove!<cr>
nmap <leader>gg  :Ggrep 
map  <leader>go  :Gbrowse<cr>
map  <leader>gO  :Gbrowse!<cr>
map  <leader>gb  :Gblame<cr>

" Toggle Gundo window
nnoremap <leader>gu :GundoToggle<CR>
