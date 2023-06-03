return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    filetype_exclude = {
      "",
      "checkhealth",
      "fugitive",
      "gitcommit",
      "help",
      "lspinfo",
      "man",
      "markdown",
      "packer",
    },
    use_treesitter = true,
  },
}
