require("em.plugins")
require("em.options")
require("em.autocmds")
require("em.lsp")

vim.api.nvim_set_keymap("n", "<m-j>", [[:m .+1<cr>==]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<m-k>", [[:m .-2<cr>==]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<m-j>", [[<esc>:m .+1<cr>==gi]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<m-k>", [[<esc>:m .-2<cr>==gi]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<m-j>", [[:m '>+1<cr>gv=gv]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<m-k>", [[:m '<-2<cr>gv=gv]], { noremap = true, silent = true })
