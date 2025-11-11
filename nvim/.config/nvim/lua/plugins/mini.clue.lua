return {
  {
    "nvim-mini/mini.clue",
    version = false,
    dependencies = {
      "nvim-mini/mini.bracketed",
    },
    keys = {
      "<c-g>",
      "cp",
      "<leader>",
      "[",
      "]",
      [[\]],
    },
    opts = {
      clues = {
        { mode = "n", keys = "<c-g>", desc = "+Chat" },
        { mode = "n", keys = "cp", desc = "+Copy" },
        { mode = "n", keys = "<leader>c", desc = "+CC" },
        { mode = "n", keys = "<leader>f", desc = "+Find" },
        { mode = "n", keys = "<leader>o", desc = "+OpenCode" },
        { mode = "n", keys = "<leader>t", desc = "+Test" },
        { mode = "n", keys = "<leader>T", desc = "+Todo" },

        { mode = "x", keys = "<leader>c", desc = "+CC" },
        { mode = "x", keys = "<leader>o", desc = "+OpenCode" },
        { mode = "x", keys = "<leader>T", desc = "+Todo" },
      },
      triggers = {
        { mode = "n", keys = "<leader>" },
        { mode = "x", keys = "<leader>" },

        { mode = "n", keys = "<c-g>" },
        { mode = "i", keys = "<c-g>" },
        { mode = "v", keys = "<c-g>" },
        { mode = "x", keys = "<c-g>" },

        { mode = "n", keys = "cp" },

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
