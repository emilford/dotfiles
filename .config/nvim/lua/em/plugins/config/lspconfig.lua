local M = {}

function M.config()
  local lspconfig = require("lspconfig")

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

  lspconfig.tsserver.setup({
    on_attach = function(client, bufnr)
      -- client.resolved_capabilities.document_formatting = false
      -- client.resolved_capabilities.document_range_formatting = false

      local ts_utils = require("nvim-lsp-ts-utils")
      ts_utils.setup({})
      ts_utils.setup_client(client)

      vim.api.nvim_buf_create_user_command(bufnr, "LspTSOrganize", "TSLspOrganize", {})
      vim.api.nvim_buf_create_user_command(bufnr, "LspTSRenameFile", "TSLspRenameFile", {})
      vim.api.nvim_buf_create_user_command(bufnr, "LspTSImportAll", "TSLspImportAll", {})

      on_attach(client, bufnr)
    end,
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
