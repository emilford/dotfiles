function! ToggleWrap()
  if(&wrap == 1)
    set nowrap
  else
    set wrap
  endif
endfunction

command! -nargs=0 ToggleWrap call ToggleWrap()
