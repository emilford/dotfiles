require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<c-\\>"] = require("telescope.actions.layout").toggle_preview,
			},
		},
		preview = {
			hide_on_startup = true,
		},
	},
})

require("telescope").load_extension("fzf")

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
