vim.api.nvim_set_keymap(
	"n",
	"<c-p>",
	[[<cmd> lua require("telescope.builtin").git_files()<cr>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>ff",
	[[<cmd> lua require("telescope.builtin").git_files()<cr>]],
	{ noremap = true, silent = true }
)
