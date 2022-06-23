local M = {}

function M.config()
  vim.keymap.set("n", "<leader>ra", ":VtrAttachToPane<cr>")
  vim.keymap.set("n", "<leader>rc", ":VtrClearRunner<cr>")
  vim.keymap.set("n", "<leader>rf", ":VtrFocusRunner<cr>")
  vim.keymap.set("n", "<leader>ro", ":VtrOpenRunner<cr>")
  vim.keymap.set("n", "<leader>rk", ":VtrKillRunner<cr>")
end

return M
