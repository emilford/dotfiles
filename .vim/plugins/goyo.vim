Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }

function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z; or tmux resize-pane -Z
  colorscheme pencil
  set background=light
  set linebreak
  set nocursorline
  set nolist
  set noshowcmd
  set noshowmode
  set scrolloff=999
  set wrap
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z; and tmux resize-pane -Z
  colorscheme nord
  set background=dark
  set cursorline
  set list
  set nolinebreak
  set nowrap
  set scrolloff=3
  set showcmd
  set showmode
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
