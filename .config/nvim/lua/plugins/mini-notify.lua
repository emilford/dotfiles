return {
  "echasnovski/mini.notify",
  event = "VeryLazy",
  opts = {
    window = {
      winblend = 0,
    },
  },
  init = function()
    vim.notify = require("mini.notify").make_notify()
  end,
}
