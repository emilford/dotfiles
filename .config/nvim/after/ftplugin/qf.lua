vim.keymap.set("n", "<left>", "<Plug>(qf_older)", { desc = "Navigate to older list" })
vim.keymap.set("n", "<right>", "<Plug>(qf_newer)", { desc = "Navigate to newer list" })

vim.keymap.set("n", "{", "<Plug>(qf_previous_file)", { desc = "Jump to previous group of file entries" })
vim.keymap.set("n", "}", "<Plug>(qf_next_file)", { desc = "Jump to next group of file entries" })
