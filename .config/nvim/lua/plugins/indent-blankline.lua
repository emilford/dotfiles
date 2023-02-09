return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    vim.g.indent_blankline_use_treesitter = true

    require("indent_blankline").setup()
  end,
}
