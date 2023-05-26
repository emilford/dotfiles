return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    use_treesitter = true,
  },
  config = function(_plugin, opts)
    vim.g.indent_blankline_filetype_exclude =
      vim.list_extend(vim.g.indent_blankline_filetype_exclude, { "fugitive", "gitcommit", "markdown" })
    require("indent_blankline").setup(opts)
  end,
}
