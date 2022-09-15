local M = {}

function M.config()
  vim.g.indent_blankline_use_treesitter = true

  require("indent_blankline").setup()
end

return M
