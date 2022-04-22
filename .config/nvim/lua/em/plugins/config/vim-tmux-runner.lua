local M = {}

function M.config()
  vim.keymap.set("n", "ra", ":VtrAttachToPane<cr>")
  vim.keymap.set("n", "rc", ":VtrClearRunner<cr>")
  vim.keymap.set("n", "rf", ":VtrFocusRunner<cr>")
  vim.keymap.set("n", "ro", ":VtrOpenRunner<cr>")
  vim.keymap.set("n", "rk", ":VtrKillRunner<cr>")
end

return M
