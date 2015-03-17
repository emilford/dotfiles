" Do not make a backup before overwriting a file
set nobackup

" Do not make a backup before writing a file
set nowritebackup

" Do not make a swapfile
set noswapfile

" Expand tabs to appropriate number of spaces
set expandtab

" Set all tabs equal to two spaces
set tabstop=2
set softtabstop=2

" Set indent width to two spaces
set shiftwidth=2

" Remember the last 1000 commands
set history=1000

" Enable copy/paste between OS X clipboard
set clipboard=unnamed

" Copy indent from current line when starting a new line
set autoindent

" Enable command-completion window
set wildmenu

" List all matches and complete til longest common match
set wildmode=list:longest

" Default to no line wrapping
set nowrap

" Allow - to be considered part of a word
set iskeyword+=-

" Move to next/previous row instead of line
nnoremap j gj
nnoremap k gk

" Enable backspacing over everything in insert mode
set backspace=indent,eol,start
