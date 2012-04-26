let mapleader=","

" Load bundles via Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Turn on syntax highlighting
syntax on

" Exit insert mode
" map ii <Esc>

" Solarized colorscheme
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Load my custom color settings
:color erm256

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

" Remember more commands and search history
set history=1000

" Make tab completion for files/buffers act like bash
set wildmenu

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase

" Keep more context when scrolling off the end of a buffer
set scrolloff=3

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Disable backups
set nobackup
set nowb
set noswapfile

" Show the cursor position all the time
set ruler	

" Display incomplete commands
set showcmd		

" Disable arrow keys
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

" Marks end match with $ for clarity
set cpoptions=Bces$

" Editing configuration
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set laststatus=2
set showmatch
set incsearch
set textwidth=78

" Highlight searching
set hls

" Emacs-style tab completion when selecting files, etc
set wildmode=longest,list

" Put useful info in status line
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" Folding settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=0

" Clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

" Launches tab autocomplete
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Always show tab bar
set showtabline=2

" Yanks work with clipboard
set clipboard=unnamed

" Highlight current line
set cursorline

" Command line height
set cmdheight=2

" Jump to first open window that contains buffer
set switchbuf=useopen

" Insert current directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Quick file rename
map <leader>n :call RenameFile()<cr>

" Line number
set number
set numberwidth=5

" Removes any trailing white space
command! KWS :normal :%s/ *$//g<cr><c-o><cr>

" Copies gist url to clipboard
let g:gist_clip_command = 'pbcopy'

" Detect filetype if vim fails to
let g:gist_detect_filetype = 1

" Do not open browser
let g:gist_open_browser_after_post = 0

" Vim-commentary shortcut
map <leader>cc \\\

" Default shell
set shell=bash

" Enters current timestamp
command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<cr>

" Fast editing of the .vimrc.local
map <leader>e :e ~/.vimrc<CR>

" Cmd+J/K to move line down/up
nmap <D-j> mz:m+<cr>`z
nmap <D-k> mz:m-2<cr>`z
vmap <D-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <D-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Window navigation shortcuts
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl-P
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Invoke with ,f
let g:ctrlp_map = '<leader>f'

" Show match window at top of the screen
let g:ctrlp_match_window_bottom = 0

" Show matches in order from top to bottom
let g:ctrlp_match_window_reversed = 0

" Do not manage the working directory
let g:ctrlp_working_path_mode = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection. Loads indent files, to automatically do 
  " any language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  augroup END

  augroup myfiletypes
    autocmd!

    autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
    autocmd FileType python                                             set ai sw=4 sts=4 et

    autocmd BufRead,BufNewFile *.html source ~/.vim/indent/html.vim
    autocmd BufRead,BufNewFile *.sass setfiletype sass 

    autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

    autocmd BufRead *.mkd       set ai formatoptions=tcroqn2 comments=n:&gt;
    autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;
  augroup END

  " Auto reload ~/.gvimrc.local and ~/.vimrc.local on save
  autocmd! bufwritepost ~/.gvimrc source ~/.gvimrc
  autocmd! bufwritepost ~/.vimrc  source ~/.vimrc

else

  " Always set autoindenting on
  set autoindent		

endif " has("autocmd")


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File navigation shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>t  :call RunTestFile()<cr>
map <leader>T  :call RunNearestTest()<cr>
map <leader>a  :call RunTests('spec')<cr>

map <leader>c :w\|:!cucumber<cr>
map <leader>C :w\|:!cucumber --profile wip<cr>

map <leader>r  :e      config/routes.rb<cr> 
map <leader>rs :split  config/routes.rb<cr> 
map <leader>rv :vsplit config/routes.rb<cr> 
map <leader>R  :call   ShowRoutes()<cr>

map <leader>g  :e      Gemfile<cr>
map <leader>gs :split  Gemfile<cr>
map <leader>gv :vsplit Gemfile<cr>

nnoremap <leader><leader> <c-^>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo

    if match(a:filename, '\.feature$') != -1
        exec ":!bundle exec cucumber " . a:filename
    else
        if filereadable("script/test")
            exec ":!script/test " . a:filename
        else
            exec ":!rspec " . a:filename
        end
    end
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:test_file")
        return
    end
    call RunTests(t:test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__

  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile

  " Delete everything
  :normal 1GdG
  
  " Put routes output in buffer
  :0r! bundle exec rake -s routes

  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "

  " Move cursor to bottom
  :normal 1GG

  " Delete empty trailing line
  :normal dd
endfunction

" Remap the tab key to do autocompletion or indentation depending on the
" context (from http://www.vim.org/tips/tip.php?tip_id=102)
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'))
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
