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

	require("lsp_signature").on_attach()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		},
		capabilities = capabilities,
	}

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)

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
			with_text = true,
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
