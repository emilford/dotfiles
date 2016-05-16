Plug 'mtth/scratch.vim'

" Open scratch window in a vertical split
let g:scratch_horizontal = 1

" Width of split
let g:scratch_height = 20

" Persist scratch window
let g:scratch_persistence_file = 'project-notes.txt'

" Customize key mappings so to no conflict with vim-sort-motion's gs
let g:scratch_no_mappings = 1
nmap gn <plug>(scratch-insert-reuse)
nmap gN <plug>(scratch-insert-clear)
xmap gn <plug>(scratch-selection-reuse)
xmap gS <plug>(scratch-selection-clear)
