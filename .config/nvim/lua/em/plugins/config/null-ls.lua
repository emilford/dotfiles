local M = {}

function M.config()
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
end

return M
