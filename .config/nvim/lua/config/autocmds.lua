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

vim.api.nvim_create_augroup("close_with_q", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "close_with_q",
  pattern = {
    "help",
    "lspinfo",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufWrite" }, {
  pattern = { "**/jsonschema/**" },
  command = "set filetype=json",
})
