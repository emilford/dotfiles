vim.api.nvim_create_augroup("AutoInsert", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "AutoInsert",
  pattern = "gitcommit",
  command = "startinsert",
})

vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  group = "CursorLine",
  callback = function()
    vim.wo.cursorline = true
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  group = "CursorLine",
  callback = function()
    vim.wo.cursorline = false
  end,
})

vim.api.nvim_create_augroup("AutoMkdir", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  group = "AutoMkdir",
  callback = function(event)
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

vim.api.nvim_create_autocmd("VimResized", {
  command = "wincmd =",
})

vim.api.nvim_create_autocmd("CursorMoved", {
  pattern = "*",
  command = "norm zz",
})

-- https://github.com/keith/rspec.vim/issues/39
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*_spec.rb", "*_shared_examples.rb, *_shared_context.rb" },
  command = "set syntax=rspec filetype=ruby.rspec",
})

vim.api.nvim_create_augroup("HighlightYank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "HighlightYank",
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_user_command("DiagnosticNext", vim.diagnostic.goto_next, {})
vim.api.nvim_create_user_command("DiagnosticPrev", vim.diagnostic.goto_prev, {})
vim.api.nvim_create_user_command("DiagnosticLine", vim.diagnostic.open_float, {})
vim.api.nvim_create_user_command("DiagnosticSetloclist", vim.diagnostic.setloclist, {})
