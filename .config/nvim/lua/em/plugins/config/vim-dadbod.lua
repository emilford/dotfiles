local M = {}

function M.config()
  vim.api.nvim_set_keymap("n", "<C-Q>", "db#op_exec()", { expr = true })
  vim.api.nvim_set_keymap("n", "<C-Q>", "db#op_exec()", { expr = true })
end

return M
