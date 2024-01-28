return {
  "echasnovski/mini.clue",
  version = false,
  event = "VeryLazy",
  opts = {
    triggers = {
      -- dap
      { mode = "n", keys = "<leader>d" },
      { mode = "x", keys = "<leader>d" },

      -- neotest
      { mode = "n", keys = "<leader>t" },

      -- zk
      { mode = "n", keys = "<leader>z" },
      { mode = "x", keys = "<leader>z" },
    },
    window = {
      config = {
        width = "auto",
      },
    },
  },
}
