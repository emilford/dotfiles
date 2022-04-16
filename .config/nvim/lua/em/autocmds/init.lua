vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
  group = "CursorLine",
  command = "setlocal cursorline",
})

vim.api.nvim_create_autocmd("WinLeave", {
  group = "CursorLine",
  command = "setlocal nocursorline",
})

vim.api.nvim_create_autocmd("VimResized", {
  command = "wincmd =",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "sql", "mysql", "plsql" },
  callback = function()
    require("cmp").setup.buffer({
      sources = {
        { name = "vim-dadbod-completion" },
      },
      formatting = {
        format = function(_, vim_item)
          vim_item.kind = nil
          vim_item.menu = "[DB]"
          return vim_item
        end,
      },
    })
  end,
})
