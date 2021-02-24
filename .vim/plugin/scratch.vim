let g:scratch_height = 20
let g:scratch_insert_autohide = 0
let g:scratch_no_mappings = 1
let g:scratch_persistence_file = 'project-notes.txt'

" Pneumonic: go to notes
nmap gN <plug>(scratch-insert-clear)
nmap gn <plug>(scratch-insert-reuse)
xmap gN <plug>(scratch-selection-clear)
xmap gn <plug>(scratch-selection-reuse)
