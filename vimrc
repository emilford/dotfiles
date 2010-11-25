set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pathogen
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let g:mapleader = ","

color madeofcode
syntax on

nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

set ruler
set number
set cmdheight=2
set guioptions-=T
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set guifont=Bitstream\ Vera\ Sans\ Mono:h11
set linebreak
set autoindent
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
"set statusline=%{fugitive#statusline()}%{rails#statusline()}
set statusline=%<%{fugitive#statusline()}\ %n:%F\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

" Marks end with $ for clarity
set cpoptions=Bces$

" Disable backups
set nobackup
set nowb
set noswapfile

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc
set laststatus=2


" Auto reload ~/.vimrc on save
autocmd! bufwritepost ~/.config/vimrc source ~/.config/vimrc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction

function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<CR>

" Cmd+J/K to move line down/up
nmap <D-j> mz:m+<cr>`z
nmap <D-k> mz:m-2<cr>`z
vmap <D-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <D-k> :m'<-2<cr>`>my`<mzgv`yo`z

"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Navigation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Window navigation shortcuts
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

" Command line navigation shortcuts
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" Maps to make handling windows a bit easier
noremap <silent> ,h :wincmd h<CR>
noremap <silent> ,j :wincmd j<CR>
noremap <silent> ,k :wincmd k<CR>
noremap <silent> ,l :wincmd l<CR>
noremap <silent> ,sb :wincmd p<CR>
noremap <silent> <C-F9>  :vertical resize -10<CR>
noremap <silent> <C-F10> :resize +10<CR>
noremap <silent> <C-F11> :resize -10<CR>
noremap <silent> <C-F12> :vertical resize +10<CR>
noremap <silent> ,s8 :vertical resize 83<CR>
noremap <silent> ,cj :wincmd j<CR>:close<CR>
noremap <silent> ,ck :wincmd k<CR>:close<CR>
noremap <silent> ,ch :wincmd h<CR>:close<CR>
noremap <silent> ,cl :wincmd l<CR>:close<CR>
noremap <silent> ,cc :close<CR>
noremap <silent> ,cw :cclose<CR>
noremap <silent> ,ml <C-W>L
noremap <silent> ,mk <C-W>K
noremap <silent> ,mh <C-W>H
noremap <silent> ,mj <C-W>J
noremap <silent> <C-7> <C-W>>
noremap <silent> <C-8> <C-W>+
noremap <silent> <C-9> <C-W>+
noremap <silent> <C-0> <C-W>>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" Use left/right arrow keys to navigate buffers
map <right> :bn<cr>
map <left>  :bp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rails
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes
autocmd User Rails map <Leader>p :Rstep 
autocmd User Rails map <Leader>sp :RSstep 
autocmd User Rails map <Leader>tp :RTstep 

autocmd User Rails map <Leader>m :Rmodel 
autocmd User Rails map <Leader>c :Rcontroller 
autocmd User Rails map <Leader>v :Rview 
autocmd User Rails map <Leader>u :Runittest 
autocmd User Rails map <Leader>f :Rfunctionaltest 
autocmd User Rails map <Leader>i :Rintegrationtest 
autocmd User Rails map <Leader>h :Rhelper 
autocmd User Rails map <Leader>r :Rconfig<CR>

autocmd User Rails map <Leader>mt :RTmodel 
autocmd User Rails map <Leader>ct :RTcontroller 
autocmd User Rails map <Leader>vt :RTview 
autocmd User Rails map <Leader>ut :RTunittest 
autocmd User Rails map <Leader>ft :RTfunctionaltest 
autocmd User Rails map <Leader>it :RTintegrationtest 
autocmd User Rails map <Leader>ht :RThelper 
autocmd User Rails map <Leader>rt :RTconfig<CR>

autocmd User Rails map <Leader>ms :RSmodel 
autocmd User Rails map <Leader>cs :RScontroller 
autocmd User Rails map <Leader>vs :RSview 
autocmd User Rails map <Leader>us :RSunittest 
autocmd User Rails map <Leader>fs :RSfunctionaltest 
autocmd User Rails map <Leader>is :RSintegrationtest 
autocmd User Rails map <Leader>hs :RShelper 
autocmd User Rails map <Leader>rs :RSconfig<CR>

autocmd User Rails map <Leader>mv :RVmodel 
autocmd User Rails map <Leader>cv :RVcontroller 
autocmd User Rails map <Leader>vv :RVview 
autocmd User Rails map <Leader>uv :RVunittest 
autocmd User Rails map <Leader>fv :RVfunctionaltest 
autocmd User Rails map <Leader>iv :RVintegrationtest 
autocmd User Rails map <Leader>hv :RVhelper 
autocmd User Rails map <Leader>rv :RVconfig<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git/Github
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:github_user='emilford'
let g:github_token='d57ce4942bd71a99d8a3b8bcaa1065ca'

map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit
map <Leader>gl :Glog
map <Leader>gd :Gdiff

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle spellcheck
map <leader>ss :setlocal spell!<cr>

" Navigate spellcheck
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function s:CdIfDirectory(directory)
  if isdirectory(a:directory)       
    call ChangeDirectory(a:directory)
  endif                            
endfunction                         
                                     
function s:UpdateNERDTree(stay)       
  if exists("t:NERDTreeBufName")       
    if bufwinnr(t:NERDTreeBufName) != -1
      NERDTree 
      if !a:stay
        wincmd p
      end
    endif
  endif   
endfunction

function s:CommandCabbr(abbreviation, expansion)
  execute 'cabbrev ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
endfunction

function s:FileCommand(name, ...)
  if exists("a:1")
    let funcname = a:1
  else
    let funcname = a:name
  endif

  execute 'command -nargs=1 -complete=file ' . a:name . ' :call ' . funcname . '(<f-args>)'
endfunction

function s:DefineCommand(name, destination)
  call s:FileCommand(a:destination)
  call s:CommandCabbr(a:name, a:destination)
endfunction

function ChangeDirectory(dir, ...)
  execute "cd " . a:dir
  let stay = exists("a:1") ? a:1 : 1
  call s:UpdateNERDTree(stay)
endfunction

function Touch(file)
  execute "!touch " . a:file
  call s:UpdateNERDTree(1)
endfunction

function Remove(file)
  let current_path = expand("%")
  let removed_path = fnamemodify(a:file, ":p")

  if (current_path == removed_path) && (getbufvar("%", "&modified"))
    echo "You are trying to remove the file you are editing. Please close the buffer first."
  else
    execute "!rm " . a:file
  endif
endfunction

function Edit(file)
  if exists("b:NERDTreeRoot")
    wincmd p
  endif

  execute "e " . a:file

ruby << RUBY
  destination = File.expand_path(VIM.evaluate(%{system("dirname " . a:file)}))
  pwd         = File.expand_path(Dir.pwd)
  home        = pwd == File.expand_path("~")

  if home || Regexp.new("^" + Regexp.escape(pwd)) !~ destination
    VIM.command(%{call ChangeDirectory(system("dirname " . a:file), 0)})
  end
RUBY
endfunction

" Define the NERDTree-aware aliases
call s:DefineCommand("cd", "ChangeDirectory")
call s:DefineCommand("touch", "Touch")
call s:DefineCommand("rm", "Remove")
call s:DefineCommand("e", "Edit")

map <Leader>n :NERDTreeToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command-T
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:CommandTMaxHeight=20

" Command-T for CommandT
macmenu &File.New\ Tab key=<nop>
map <D-t> :CommandT<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File Types
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=72
endfunction

function! s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Mm <CR>
endfunction

au FileType make   set noexpandtab
au FileType python set noexpandtab
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()
au BufRead,BufNewFile *.txt call s:setupWrapping()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-Shift-F for Ack
macmenu Window.Toggle\ Full\ Screen\ Mode key=<nop>
map <D-F> :Ack<space>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ConqueTerm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function StartTerm()
  execute 'ConqueTerm ' . $SHELL . ' --login'
  setlocal listchars=tab:\ \ 
endfunction

" Command-e for ConqueTerm
map <D-e> :call StartTerm()<CR>
