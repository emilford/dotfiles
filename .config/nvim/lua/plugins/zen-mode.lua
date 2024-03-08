return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  keys = {
    {
      "<c-w>m",
      function()
        require("zen-mode").toggle({
          window = {
            height = 1,
            width = 1,
            options = {},
          },
          plugins = {
            options = {
              enabled = false,
            },
            kitty = {
              enabled = false,
            },
          },
        })
      end,
      desc = "Zoom current buffer",
    },
    {

      "<leader>z",
      function()
        require("zen-mode").toggle({
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
      end,
    },
  },
}
