return {
  {
    "echasnovski/mini.notify",
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      window = {
        winblend = 0,
      },
    },
    config = function(_, opts)
      require("mini.notify").setup(opts)
      vim.notify = require("mini.notify").make_notify()
    end,
  },
}
