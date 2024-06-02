return {
  "echasnovski/mini.clue",
  version = false,
  event = "VeryLazy",
  opts = {
    clues = {
      { mode = "n", keys = "<leader>n", desc = "+Notes" },
    },
    triggers = {
      -- dap
      { mode = "n", keys = "<leader>d" },
      { mode = "x", keys = "<leader>d" },

      -- mini.basics
      { mode = "n", keys = "\\" },

      -- mini.bracketed
      { mode = "n", keys = "[" },
      { mode = "n", keys = "]" },

      -- vim-test
      { mode = "n", keys = "<leader>t" },

      -- obsidian.nvim
      { mode = "n", keys = "<leader>n" },
      { mode = "x", keys = "<leader>n" },

      -- mini.pick
      { mode = "n", keys = "<leader>f" },
    },
    window = {
      config = {
        width = "auto",
      },
    },
  },
}
