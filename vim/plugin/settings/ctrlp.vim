" Show match window at top of the screen
let g:ctrlp_match_window_bottom = 0

" Show matches in order from top to bottom
let g:ctrlp_match_window_reversed = 0

" Set max display height
let g:ctrlp_max_height=20

" Do not manage the working directory 
let g:ctrlp_working_path_mode = 0

" Show hidden files
let g:ctrlp_show_hidden = 1

" Custom prompt mappings 
"   * ctrl-h opens in a horizontal split
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>', '<c-h>']
    \ }

" Files and directories to ignore
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v\/(\.git|\.bundle|bin|vendor\/bundle|tmp|public\/system)$',
    \ 'file': '\v\.(gitkeep|gitignore|jpg|jpeg|gif|png|ico)$'
    \ }
