require("config.options")
require("config.lazy")

if vim.fn.argc() == 0 then
  -- autocmds and keymaps can wait to load
  vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
      require("config.autocmds")
      require("config.keymaps")
    end,
  })
else
  -- load them now so they affect the opened buffers
  require("config.autocmds")
  require("config.keymaps")
end
