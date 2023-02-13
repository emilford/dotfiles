return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "b0o/schemastore.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "jose-elias-alvarez/typescript.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local U = require("config.utils")

    require("lspconfig.ui.windows").default_options.border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })

    lspconfig.lua_ls.setup({
      on_attach = U.on_attach,
      capatabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim", "use" },
          },
          workspace = {
            checkThirdParty = false,
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            enable = false,
          },
        },
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

    local signs = { Error = "●", Warn = "●", Hint = "○", Info = "●" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
  end,
}
