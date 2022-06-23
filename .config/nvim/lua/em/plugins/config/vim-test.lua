local M = {}

function M.config()
  vim.g["test#strategy"] = "vtr"

  vim.keymap.set("n", "<leader>tn", ":TestNearest<cr>", { silent = true })
  vim.keymap.set("n", "<leader>tf", ":TestFile<cr>", { silent = true })
  vim.keymap.set("n", "<leader>ta", ":TestSuite<cr>", { silent = true })
  vim.keymap.set("n", "<leader>tl", ":TestLast<cr>", { silent = true })
  vim.keymap.set("n", "<leader>tv", ":TestVisit<cr>", { silent = true })
end

return M
