local M = {}

function M.config()
  local lspconfig = require("lspconfig")
  local U = require("em.utils")

  require("lspconfig.ui.windows").default_options.border = "rounded"

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

  lspconfig.cssls.setup({
    on_attach = U.on_attach,
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
    on_attach = U.on_attach,
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
    on_attach = U.on_attach,
    capabilities = capabilities,
  })

  lspconfig.html.setup({
    on_attach = U.on_attach,
    capabilities = capabilities,
    filetypes = {
      "erb",
      "eruby",
      "html",
    },
  })

  lspconfig.jsonls.setup({
    on_attach = U.on_attach,
    capabilities = capabilities,
    settings = {
      schemas = require("schemastore").json.schemas(),
    },
  })

  lspconfig.solargraph.setup({
    on_attach = U.on_attach,
    capabilities = capabilities,
    init_options = {
      formatting = false,
    },
    root_dir = lspconfig.util.root_pattern(".solargraph.yml"),
  })

  lspconfig.tailwindcss.setup({
    on_attach = U.on_attach,
    capabilities = capabilities,
  })

  require("typescript").setup({
    server = {
      on_attach = U.on_attach,
    },
  })

  lspconfig.yamlls.setup({
    on_attach = U.on_attach,
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
