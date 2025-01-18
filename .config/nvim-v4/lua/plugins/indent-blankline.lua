return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "tpope/vim-sleuth" },
  opts = {
    exclude = {
      filetypes = {
        "fugitive",
        "markdown",
      },
    },
    indent = {
      char = "│",
    },
    scope = {
      enabled = false,
    },
  },
}
