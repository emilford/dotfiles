return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "ray-x/lsp_signature.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")

    lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
      capabilities = vim.tbl_deep_extend(
        "force",
        lspconfig.util.default_config.capabilities,
        require("cmp_nvim_lsp").default_capabilities()
      ),
      handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
      },
    })

    require("lspconfig.ui.windows").default_options.border = "rounded"

    vim.diagnostic.config({
      float = {
        border = "rounded",
        source = "always",
      },
      virtual_text = false,
      severity_sort = true,
    })

    for _, type in ipairs({ "Error", "Hint", "Info", "Warn" }) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = "●", texthl = hl, numhl = hl })
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "LSP actions",
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        require("lsp_signature").on_attach({ toggle_key = "<M-x>" }, args.buf)

        if client.supports_method("textDocument/codeAction") then
          vim.api.nvim_buf_create_user_command(args.buf, "LspCodeAction", function()
            vim.lsp.buf.code_action()
          end, {})
        end

        if client.supports_method("textDocument/definition") then
          vim.api.nvim_buf_create_user_command(args.buf, "LspDefinition", vim.lsp.buf.definition, {})
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
        end

        if client.supports_method("textDocument/hover") then
          vim.api.nvim_buf_create_user_command(args.buf, "LspHover", vim.lsp.buf.hover, {})
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover documentation" })
        end

        if client.supports_method("textDocument/implementation") then
          vim.api.nvim_buf_create_user_command(args.buf, "LspImplementation", vim.lsp.buf.implementation, {})
        end

        if client.supports_method("textDocument/references") then
          vim.api.nvim_buf_create_user_command(args.buf, "LspReferences", vim.lsp.buf.references, {})
        end

        if client.supports_method("textDocument/rename") then
          vim.api.nvim_buf_create_user_command(args.buf, "LspRename", function()
            vim.lsp.buf.rename()
          end, {})
        end

        if client.supports_method("textDocument/signatureHelp") then
          vim.api.nvim_buf_create_user_command(args.buf, "LspSignatureHelp", vim.lsp.buf.signature_help, {})
        end

        if client.supports_method("textDocument/typeDefinition") then
          vim.api.nvim_buf_create_user_command(args.buf, "LspTypeDefinition", vim.lsp.buf.type_definition, {})
        end
      end,
    })
  end,
}
