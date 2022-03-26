local M = {}

function M.config()
  vim.api.nvim_set_keymap("n", "ra", ":VtrAttachToPane<cr>", { noremap = true })
  vim.api.nvim_set_keymap("n", "rc", ":VtrClearRunner<cr>", { noremap = true })
  vim.api.nvim_set_keymap("n", "rf", ":VtrFocusRunner<cr>", { noremap = true })
  vim.api.nvim_set_keymap("n", "ro", ":VtrOpenRunner<cr>", { noremap = true })
  vim.api.nvim_set_keymap("n", "rk", ":VtrKillRunner<cr>", { noremap = true })
end

return M
