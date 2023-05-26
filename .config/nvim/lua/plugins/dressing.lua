return {
  "stevearc/dressing.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    input = {
      win_options = {
        winblend = 0
      },
    },
  },
}
