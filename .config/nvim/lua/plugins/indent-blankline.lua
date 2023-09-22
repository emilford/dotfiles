return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  branch = "v3",
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
  },
}
