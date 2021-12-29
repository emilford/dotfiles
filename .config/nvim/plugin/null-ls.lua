require("null-ls").setup({
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,

	sources = {
		require("null-ls").builtins.diagnostics.standardrb,
		require("null-ls").builtins.formatting.prettier,
		require("null-ls").builtins.formatting.standardrb,
		require("null-ls").builtins.formatting.stylua,
	},
})
