let mapleader=","

call plug#begin()
for file in split(glob('$HOME/.vim/plugins/*'), '\n')
  execute 'source' file
endfor
call plug#end()

filetype plugin indent on     " load plugin and indent files for specific file types

syntax enable                 " enable syntax highlighting and do not overrule custom settings

colorscheme nord

set autoindent                " copy indent from current line when starting a new line
set autoread                  " automatically read a file when a change to the file outside of Vim is detected
set background=dark           " use colors that look good on a dark background
set backspace+=eol            " allow backspacing over line breaks (join lines)
set backspace+=indent         " allow backspacing over autoindent
set backspace+=start          " allow backspacing over the start of insert
set colorcolumn=81            " higlight the 81st screen column
set cpoptions+=$              " when making a change to one line, put a $ at the end of the changed text
set cursorline                " highlight the screen line of the cursor
set expandtab                 " use the appropriate number of spaces to insert a <Tab>
set hidden                    " hide buffer when it is abandoned
set hlsearch                  " when there is a previous search pattern, highlight all its matches
set incsearch                 " when typing a search command, highlight matches as it was typed so far
set laststatus=1              " only show status if there are at least two windows
set list                      " enable list mode
set listchars+=eol:\          " character to list at the end of each line
set listchars+=tab:\ \        " character to list a <Tab>
set listchars+=trail:·        " character to list trailing spaces
set matchtime=2               " tenths of a second to show the matching paren when showmatch is set
set nojoinspaces              " insert only one space after '.', '?', and '!' with a join command
set noswapfile                " do not user a swapfile for the buffer
set nowrap                    " do not wrap lines longer than the width of the window
set nowritebackup             " do not make a backup before overwriting a file
set scrolloff=3               " minimal number of screen lines to keep above/below the cursor
set shell=/bin/bash           " force bash shell; fish causes some odd behavior in some cases
set shiftwidth=2              " number of spaces to use for each step of (auto)indent
set shortmess+=I              " do not show the intro message when starting Vim
set showmatch                 " when a bracket is inserted, briefly jump to the matching one
set switchbuf=useopen         " jump to first open window that contains the specificed buffer
set tabstop=2                 " number of spaces that a <Tab> in the file counts for
set tags^=./.git/tags         " set tags location for fugitive.vim
set termguicolors             " use 24-bit color
set wildmenu                  " enable enhanced command-line completion
set wildmode=list:longest     " when more than one match, list all matches and complete till longest common string

nnoremap <left>  <c-w><                                         " resize windows with arrow keys
nnoremap <right> <c-w>>
nnoremap <up>    <c-w>+
nnoremap <down>  <c-w>-

nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')                   " move by display lines upward unless count given
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')                   " move by display lines downward unless count given

augroup CursorLine                                              " only highlight the screen line of the active window
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

autocmd! VimResized * :wincmd =                                 " automatically rebalance windows on vim resize

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
