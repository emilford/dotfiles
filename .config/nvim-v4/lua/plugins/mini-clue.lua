return {
  "echasnovski/mini.clue",
  version = false,
  event = "VeryLazy",
  opts = {
    clues = {
      { mode = "n", keys = "<c-g>", desc = "+Chat" },
      { mode = "n", keys = "<leader>d", desc = "+Debug" },
      { mode = "n", keys = "<leader>f", desc = "+Find" },
      { mode = "n", keys = "<leader>n", desc = "+Notes" },
      { mode = "n", keys = "<leader>s", desc = "+Snippet" },
      { mode = "n", keys = "<leader>t", desc = "+Test" },

      { mode = "x", keys = "<leader>d", desc = "+Debug" },
      { mode = "x", keys = "<leader>s", desc = "+Snippet" },
    },
    triggers = {
      { mode = "n", keys = "<leader>" },
      { mode = "x", keys = "<leader>" },

      -- gp
      { mode = "n", keys = "<c-g>" },
      { mode = "i", keys = "<c-g>" },
      { mode = "v", keys = "<c-g>" },
      { mode = "x", keys = "<c-g>" },

      -- mini.basics
      { mode = "n", keys = "\\" },

      -- mini.bracketed
      { mode = "n", keys = "[" },
      { mode = "n", keys = "]" },
    },
    window = {
      config = {
        width = "auto",
      },
    },
  },
}
