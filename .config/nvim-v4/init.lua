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

local theme = os.getenv("HOME") .. "/.theme"

local function adjust_theme()
  local mode = io.open(theme, "r") and io.input(theme):read() or "dark"
  vim.opt.background = mode
end

adjust_theme()

vim.loop.fs_event_start(vim.loop.new_fs_event(), theme, {}, vim.schedule_wrap(adjust_theme))
