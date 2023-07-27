vim.bo.formatexpr = "format#Format()"
vim.bo.textwidth = 72
vim.api.nvim_set_option_value("colorcolumn", false, { scope = "local" })
vim.api.nvim_set_option_value("number", false, { scope = "local" })
vim.api.nvim_set_option_value("relativenumber", false, { scope = "local" })
vim.api.nvim_set_option_value("spell", true, { scope = "local" })
