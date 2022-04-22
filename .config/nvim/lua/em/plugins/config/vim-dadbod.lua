local M = {}

function M.config()
  vim.keymap.set("n", "<C-Q>", "db#op_exec()", { expr = true })
  vim.keymap.set("n", "<C-Q>", "db#op_exec()", { expr = true })
end

return M
