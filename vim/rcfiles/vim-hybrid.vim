" Use vim-hybrid dark colorscheme if it exists
if !empty(globpath(&rtp, 'colors/hybrid.vim'))
  let g:hybrid_use_Xresources = 1
  colorscheme hybrid
  set background=dark
endif
