Plugin 'christoomey/vim-tmux-runner'

" The orientation used when creating the tmux split pane to use as the runner pane.
let g:VtrOrientation = "h"

" The percent of the tmux window the runner pane will occupy.
let g:VtrPercentage = 30

nnoremap <leader>ra :VtrAttachToPane<cr>
nnoremap <leader>rO :VtrReorientRunner<cr>
nnoremap <leader>rc :VtrSendCommandToRunner<cr>
nnoremap <leader>rl :VtrSendLinesToRunner<cr>
nnoremap <leader>ro :VtrOpenRunner<cr>
nnoremap <leader>rk :VtrKillRunner<cr>
nnoremap <leader>rf :VtrFocusRunner<cr>
nnoremap <leader>rd :VtrDetachRunner<cr>
nnoremap <leader>rC :VtrClearRunner<cr>
