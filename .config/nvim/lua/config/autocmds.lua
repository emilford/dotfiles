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

-- https://github.com/keith/rspec.vim/issues/39
vim.api.nvim_create_autocmd({ "Bufnewfile", "Bufread" }, {
  pattern = { "*_spec.rb", "*_shared_examples.rb, *_shared_context.rb" },
  command = "set syntax=rspec filetype=rspec.ruby",
})
