local M = {}

function M.config()
  require("zen-mode").setup({
    window = {
      backdrop = 1,
      width = 80,
      options = {
        signcolumn = "no",
        number = false,
        cursorline = false,
        cursorcolumn = false,
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        showcmd = false,
      },
      tmux = {
        enabled = true,
      },
      kitty = {
        enabled = true,
        font = "+2",
      },
    },
  })
end

return M
