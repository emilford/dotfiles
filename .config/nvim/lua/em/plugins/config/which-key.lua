local M = {}

function M.config()
  require("which-key").setup({
    ignore_missing = true,
    triggers = { "<leader>" },
  })
end

return M
