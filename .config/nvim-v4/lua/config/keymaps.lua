-- Resize window using <option> + arrow keys
vim.keymap.set("n", "<m-up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<m-down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<m-left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<m-right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
