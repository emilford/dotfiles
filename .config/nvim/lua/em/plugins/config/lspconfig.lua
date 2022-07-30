local M = {}

function M.config()
  local lspconfig = require("lspconfig")

  local win = require("lspconfig.ui.windows")
  local default_opts = win.default_opts

  win.default_opts = function(options)
    local opts = default_opts(options)
    opts.border = "rounded"
    return opts
  end

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })

  vim.api.nvim_create_user_command("LspDiagnosticNext", vim.diagnostic.goto_next, {})
  vim.api.nvim_create_user_command("LspDiagnosticPrev", vim.diagnostic.goto_prev, {})
  vim.api.nvim_create_user_command("LspDiagnosticLine", vim.diagnostic.open_float, {})
  vim.api.nvim_create_user_command("LspDiagnosticSetloclist", vim.diagnostic.setloclist, {})

  local opts = { silent = true }
  vim.keymap.set("n", "<leader>d", ":LspDiagnosticLine<cr>", opts)
  vim.keymap.set("n", "[d", ":LspDiagnosticPrev<cr>", opts)
  vim.keymap.set("n", "]d", ":LspDiagnosticNext<cr>", opts)
  vim.keymap.set("n", "<leader>q", ":LspDiagnosticSetloclist<cr>", opts)

  local on_attach = function(_, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, "LspCodeAction", vim.lsp.buf.code_action, {})
    vim.api.nvim_buf_create_user_command(bufnr, "LspDefinition", vim.lsp.buf.definition, {})
    vim.api.nvim_buf_create_user_command(bufnr, "LspFormat", vim.lsp.buf.formatting, {})
    vim.api.nvim_buf_create_user_command(bufnr, "LspHover", vim.lsp.buf.hover, {})
    vim.api.nvim_buf_create_user_command(bufnr, "LspImplementation", vim.lsp.buf.implementation, {})
    vim.api.nvim_buf_create_user_command(bufnr, "LspReferences", vim.lsp.buf.references, {})
    vim.api.nvim_buf_create_user_command(bufnr, "LspRename", vim.lsp.buf.rename, {})
    vim.api.nvim_buf_create_user_command(bufnr, "LspSignatureHelp", vim.lsp.buf.signature_help, {})
    vim.api.nvim_buf_create_user_command(bufnr, "LspTypeDefinition", vim.lsp.buf.type_definition, {})

    local opts = { buffer = bufnr, silent = true }
    vim.keymap.set("n", "K", ":LspHover<cr>", opts)
    vim.keymap.set("n", "gd", ":LspDefinition<cr>", opts)
    vim.keymap.set("n", "gy", ":LspTypeDefinition<cr>", opts)

    require("lsp_signature").on_attach()
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

  lspconfig.cssls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
      "css",
      "erb",
      "eruby",
      "html",
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "less",
      "scss",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
      "vue",
    },
  })

  lspconfig.emmet_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
      "erb",
      "eruby",
      "html",
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
      "vue",
    },
  })

  lspconfig.eslint.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })

  lspconfig.html.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
      "erb",
      "eruby",
      "html",
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
      "vue",
    },
  })

  lspconfig.jsonls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      schemas = require("schemastore").json.schemas(),
    },
  })

  lspconfig.solargraph.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
      formatting = false,
    },
    root_dir = lspconfig.util.root_pattern(".solargraph.yml"),
  })

  lspconfig.tailwindcss.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })

  require("typescript").setup({
    server = {
      on_attach = function(client, bufnr)
        vim.api.nvim_buf_create_user_command(bufnr, "LspAddMissingImports", "TypescriptAddMissingImports", {})
        vim.api.nvim_buf_create_user_command(bufnr, "LspFixAll", "TypescriptFixAll", {})
        vim.api.nvim_buf_create_user_command(bufnr, "LspOrganizeImports", "TypescriptOrganizeImports", {})
        vim.api.nvim_buf_create_user_command(bufnr, "LspRemoveUnused", "TypescriptRemoveUnused", {})
        vim.api.nvim_buf_create_user_command(bufnr, "LspRenameFile", "TypescriptRenameFile", {})

        on_attach(client, bufnr)
      end,
    },
  })

  lspconfig.yamlls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })

  vim.diagnostic.config({
    float = {
      border = "rounded",
      source = "always",
    },
    virtual_text = false,
    severity_sort = true,
  })

  local signs = { Error = "•", Warn = "•", Hint = "•", Info = "•" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

return M
