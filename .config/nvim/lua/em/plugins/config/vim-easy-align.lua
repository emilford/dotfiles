local M = {}

function M.config()
  vim.keymap.set("v", "<enter>", "<plug>(EasyAlign)")
  vim.keymap.set("n", "ga", "<plug>(EasyAlign)")
end

return M
