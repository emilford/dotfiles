local M = {}

function M.config()
  vim.api.nvim_set_keymap("v", "<enter>", "<plug>(EasyAlign)", {})
  vim.api.nvim_set_keymap("n", "ga", "<plug>(EasyAlign)", {})
end

return M
