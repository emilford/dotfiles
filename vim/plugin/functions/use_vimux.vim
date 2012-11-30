let g:use_vimux = 0

function! UseVimux()
  if g:use_vimux
    let g:use_vimux = 0
  else
    let g:use_vimux = 1
  endif
endfunction
