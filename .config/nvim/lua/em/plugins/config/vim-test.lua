local M = {}

function M.config()
  vim.g["test#strategy"] = "vtr"

  vim.keymap.set("n", "tn", ":TestNearest<cr>", { silent = true })
  vim.keymap.set("n", "tf", ":TestFile<cr>", { silent = true })
  vim.keymap.set("n", "ta", ":TestSuite<cr>", { silent = true })
  vim.keymap.set("n", "tl", ":TestLast<cr>", { silent = true })
  vim.keymap.set("n", "tv", ":TestVisit<cr>", { silent = true })
end

return M
