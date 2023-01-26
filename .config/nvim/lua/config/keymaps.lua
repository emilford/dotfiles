-- Resize window using <option> + arrow keys
vim.keymap.set("n", "<m-up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<m-down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<m-left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<m-right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move lines down/up using <option> + j/k
vim.keymap.set("n", "<m-j>", [[:m .+1<cr>==]], { silent = true })
vim.keymap.set("n", "<m-k>", [[:m .-2<cr>==]], { silent = true })
vim.keymap.set("i", "<m-j>", [[<esc>:m .+1<cr>==gi]], { silent = true })
vim.keymap.set("i", "<m-k>", [[<esc>:m .-2<cr>==gi]], { silent = true })
vim.keymap.set("v", "<m-j>", [[:m '>+1<cr>gv=gv]], { silent = true })
vim.keymap.set("v", "<m-k>", [[:m '<-2<cr>gv=gv]], { silent = true })
