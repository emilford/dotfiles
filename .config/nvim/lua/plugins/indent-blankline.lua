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
  config = function(_plugin, opts)
    require("indent_blankline").setup(opts)
  end,
}
