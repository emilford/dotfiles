vim.cmd([[
  augroup CursorLine
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
  augroup END
]])

vim.cmd([[
  autocmd! VimResized * :wincmd =
]])

vim.cmd([[
  autocmd FileType sql,mysql,plsql lua require'cmp'.setup.buffer {
  \   sources = {
  \     { name = "vim-dadbod-completion" }
  \   },
  \   formatting = {
  \     format = function(entry, vim_item)
  \       vim_item.kind = nil
  \       vim_item.menu = "[DB]"
  \       return vim_item
  \     end
  \   },
  \ }
]])
