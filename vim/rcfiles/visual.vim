" Enable syntax highlighting
syntax enable

" Use vim-hybrid dark colorscheme
colorscheme hybrid
set background=dark

" Highlight the screen line of the cursor
set cursorline

" Only highlight the screen line of the active buffer
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Show a highlight on column 80
set colorcolumn=80

" Enable list mode
set list

" Mark tabs
set listchars=tab:\ \

" Mark trailing spaces
set listchars+=trail:·

" Mark last column when line continues beyond visible text
set listchars+=extends:>

" Mark first column when line continues before visible text
set listchars+=precedes:<

" Minimum 3 lines above/below cursor
set scrolloff=3

" Mark end of replace until match with $
set cpoptions=Bces$

" Briefly jump to matching bracket
set showmatch
