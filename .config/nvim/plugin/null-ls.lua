local null_ls = require("null-ls")

local eslint_d_opts = {
	condition = function(utils)
		return utils.root_has_file({
			".eslintrc.js",
			".eslintrc.cjs",
			".eslintrc.yaml",
			".eslintrc.yml",
			".eslintrc.json",
		})
	end,
	prefer_local = "node_modules/.bin",
}

null_ls.setup({
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,

	sources = {
		null_ls.builtins.code_actions.eslint_d.with(eslint_d_opts),
		null_ls.builtins.diagnostics.eslint_d.with(eslint_d_opts),
		null_ls.builtins.diagnostics.standardrb,
		null_ls.builtins.formatting.eslint_d.with(eslint_d_opts),
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.standardrb,
		null_ls.builtins.formatting.stylua,
	},
})
