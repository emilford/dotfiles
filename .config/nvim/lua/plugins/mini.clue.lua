return {
  {
    "echasnovski/mini.clue",
    version = false,
    dependencies = {
      "echasnovski/mini.bracketed",
    },
    keys = {
      "<c-g>",
      "<leader>",
      "[",
      "]",
      [[\]],
    },
    opts = {
      clues = {
        { mode = "n", keys = "<c-g>", desc = "+Chat" },
        { mode = "n", keys = "<leader>f", desc = "+Find" },
        { mode = "n", keys = "<leader>t", desc = "+Test" },
      },
      triggers = {
        { mode = "n", keys = "<leader>" },
        { mode = "x", keys = "<leader>" },

        { mode = "n", keys = "<c-g>" },
        { mode = "i", keys = "<c-g>" },
        { mode = "v", keys = "<c-g>" },
        { mode = "x", keys = "<c-g>" },

        { mode = "n", keys = "\\" },

        { mode = "n", keys = "[" },
        { mode = "n", keys = "]" },
      },
      window = {
        config = {
          width = "auto",
        },
      },
    },
  },
}
