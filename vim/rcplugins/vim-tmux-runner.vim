Plugin 'christoomey/vim-tmux-runner'

" The orientation used when creating the tmux split pane to use as the runner pane.
let g:VtrOrientation = "h"

" The percent of the tmux window the runner pane will occupy.
let g:VtrPercentage = 30

nnoremap <leader>ra :VtrAttachToPane<cr>
nnoremap <leader>ro :VtrReorientRunner<cr>
nnoremap <leader>rc :VtrSendCommandToRunner<cr>
nnoremap <leader>rl :VtrSendLinesToRunner<cr>
vnoremap <leader>rl :VtrSendLinesToRunner<cr>
nnoremap <leader>rO :VtrOpenRunner<cr>
nnoremap <leader>rk :VtrKillRunner<cr>
nnoremap <leader>rz :VtrFocusRunner<cr>
nnoremap <leader>rd :VtrDetachRunner<cr>
nnoremap <leader>rC :VtrClearRunner<cr>
nnoremap <leader>rF :VtrFlushCommand<cr>
nnoremap <leader>rf :VtrSendFile<cr>
