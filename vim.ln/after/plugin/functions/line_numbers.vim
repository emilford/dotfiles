function! LineNumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set nonumber
  elseif(&number == 1)
    set relativenumber
  else
    set number
  endif
endfunction

command! -nargs=0 LineNumberToggle call LineNumberToggle()
