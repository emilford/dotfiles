vim.g["test#strategy"] = "vtr"

vim.api.nvim_set_keymap("n", "tn", ":TestNearest<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "tf", ":TestFile<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "ta", ":TestSuite<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "tl", ":TestLast<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "tv", ":TestVisit<cr>", { silent = true })
