return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  init = function()
    vim.g.indent_blankline_use_treesitter = true
  end,
  config = function()
    vim.g.indent_blankline_filetype_exclude =
      vim.list_extend(vim.g.indent_blankline_filetype_exclude, { "fugitive", "gitcommit", "markdown" })
    require("indent_blankline").setup()
  end,
}
