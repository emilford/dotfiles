vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
  group = "CursorLine",
  command = "setlocal cursorline",
})

vim.api.nvim_create_autocmd({ "WinLeave", "Filetype TelescopePrompt" }, {
  group = "CursorLine",
  command = "setlocal nocursorline",
})

vim.api.nvim_create_autocmd("VimResized", {
  command = "wincmd =",
})

vim.api.nvim_create_autocmd("CursorMoved", {
  pattern = "*",
  command = "norm zz",
})
