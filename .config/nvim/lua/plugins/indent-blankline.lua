return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  init = function()
    vim.g.indent_blankline_use_treesitter = true
  end,
  config = function()
    require("indent_blankline").setup()
  end,
}
