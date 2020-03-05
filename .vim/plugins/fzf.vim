Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

nnoremap <c-p> :GFiles<CR>

let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95 } }

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --no-ignore-vcs'

command! -bang -nargs=? -complete=dir Files
	\ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--info=inline']}, 'right:72%'), <bang>0)

command! -bang -nargs=? -complete=dir GFiles
	\ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview({'options': ['--info=inline']}, 'right:72%'), <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': ['--info=inline']}, 'right:72%'), <bang>0)
