Plug 'mtth/scratch.vim'

" Open scratch window in a horizontal split
let g:scratch_horizontal = 1

" Width of split
let g:scratch_height = 20

" Persist scratch window
let g:scratch_persistence_file = 'project-notes.txt'

" Customize key mappings to avoid conflict with vim-sort-motion
" Pneumonic: go to notes
let g:scratch_no_mappings = 1
nmap gN <plug>(scratch-insert-clear)
nmap gn <plug>(scratch-insert-reuse)
xmap gN <plug>(scratch-selection-clear)
xmap gn <plug>(scratch-selection-reuse)
