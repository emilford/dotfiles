require("null-ls").setup({
	sources = {
		require("null-ls").builtins.diagnostics.standardrb,
		require("null-ls").builtins.formatting.prettier,
		require("null-ls").builtins.formatting.standardrb,
		require("null-ls").builtins.formatting.stylua,
	},
})
