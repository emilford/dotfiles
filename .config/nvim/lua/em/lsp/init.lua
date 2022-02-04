local nvim_lsp = require("lspconfig")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
	vim.cmd("command! LspDefintion lua vim.lsp.buf.definition()")
	vim.cmd("command! LspDiagnosticLine lua vim.diagnostic.open_float()")
	vim.cmd("command! LspDiagnosticNext lua vim.diagnostic.goto_next()")
	vim.cmd("command! LspDiagnosticPrev lua vim.diagnostic.goto_prev()")
	vim.cmd("command! LspDiagnosticSetLoclist lua vim.diagnostic.set_loclist()")
	vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
	vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
	vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
	vim.cmd("command! LspReferences lua vim.lsp.buf.references()")
	vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
	vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
	vim.cmd("command! LspTypeDefinition lua vim.lsp.buf.type_definition()")

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local opts = { noremap = true, silent = true }
	buf_set_keymap("n", "K", ":LspHover<cr>", opts)
	buf_set_keymap("n", "[d", ":LspDiagnosticPrev<cr>", opts)
	buf_set_keymap("n", "]d", ":LspDiagnosticNext<cr>", opts)
	buf_set_keymap("n", "gd", ":LspDefintion<cr>", opts)
	buf_set_keymap("n", "gy", ":LspTypeDefinition<cr>", opts)

	if client.resolved_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end

	require("lsp_signature").on_attach()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local lsp_installer = require("nvim-lsp-installer")

-- Include the servers you want to have installed by default below
local servers = {
	"cssls",
	"emmet_ls",
	"html",
	"jsonls",
	"solargraph",
	"sumneko_lua",
	"tailwindcss",
	"tsserver",
	"yamlls",
}

for _, name in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found then
		if not server:is_installed() then
			print("Installing " .. name)
			server:install()
		end
	end
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		},
		capabilities = capabilities,
	}

	if server.name == "jsonls" then
		opts.settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
			},
		}
	end

	if server.name == "solargraph" then
		opts.init_options = {
			formatting = false,
		}
		opts.root_dir = nvim_lsp.util.root_pattern(".solargraph.yml")
	end

	if server.name == "tsserver" then
		-- Needed for inlayHints. Merge this table with your settings or copy
		-- it from the source if you want to add your own init_options.
		opts.init_options = require("nvim-lsp-ts-utils").init_options
		opts.on_attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false

			local ts_utils = require("nvim-lsp-ts-utils")
			ts_utils.setup({})
			-- required to fix code action ranges and filter diagnostics
			ts_utils.setup_client(client)

			vim.cmd("command! LspTSOrganize TSLspOrganize")
			vim.cmd("command! LspTSRenameFile TSLspRenameFile")
			vim.cmd("command! LspTSImportAll TSLspImportAll")

			on_attach(client, bufnr)
		end
	end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)

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

local prettierd_opts = {
	condition = function(utils)
		return utils.root_has_file({
			".prettierrc",
			".prettierrc.json",
			".prettierrc.yml",
			".prettierrc.yaml",
			".prettierrc.json5",
			".prettierrc.js",
			".prettierrc.cjs",
			".prettierrc.toml",
			"prettier.config.js",
			"prettier.config.cjs",
		})
	end,
	prefer_local = "node_modules/.bin",
}

null_ls.setup({
	on_attach = on_attach,

	sources = {
		null_ls.builtins.code_actions.eslint_d.with(eslint_d_opts),
		null_ls.builtins.code_actions.proselint.with({
			extra_filetypes = { "gitcommit" },
		}),
		null_ls.builtins.diagnostics.eslint_d.with(eslint_d_opts),
		null_ls.builtins.diagnostics.gitlint,
		null_ls.builtins.diagnostics.proselint.with({
			extra_filetypes = { "gitcommit" },
		}),
		null_ls.builtins.diagnostics.standardrb,
		null_ls.builtins.diagnostics.write_good.with({
			extra_filetypes = { "gitcommit" },
		}),
		null_ls.builtins.formatting.eslint_d.with(eslint_d_opts),
		null_ls.builtins.formatting.prettierd.with(prettierd_opts),
		null_ls.builtins.formatting.standardrb,
		null_ls.builtins.formatting.stylua,
	},
})

local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	mapping = {
		["<c-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<c-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<c-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<c-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<c-y>"] = cmp.mapping.confirm({ select = true }),
		["<cr>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "ultisnips" },
		{ name = "cmp_git" },
	}, {
		{ name = "buffer" },
	}),
	formatting = {
		format = require("lspkind").cmp_format({
			mode = "symbol_text",
			preset = "codicons",
			menu = {
				buffer = "[buffer]",
				cmp_git = "[repo]",
				nvim_lsp = "[lsp]",
				nvim_lua = "[lua]",
				ultisnips = "[ultisnips]",
			},
		}),
	},
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

vim.diagnostic.config({
	float = {
		source = "always",
	},
	virtual_text = false,
	severity_sort = true, --show higher severities first in signs and virtual text
})

local signs = { Error = "•", Warn = "•", Hint = "•", Info = "•" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require("cmp_git").setup()
