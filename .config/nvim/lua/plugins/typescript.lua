return {
  "jose-elias-alvarez/typescript.nvim",
  ft = { "typescript", "typescriptreact" },
  opts = {
    server = {
      on_attach = require("config.utils").on_attach,
    },
  },
  config = function(_, opts)
    require("typescript").setup(opts)

    vim.api.nvim_buf_create_user_command(0, "LspAddMissingImports", "TypescriptAddMissingImports", {})
    vim.api.nvim_buf_create_user_command(0, "LspFixAll", "TypescriptFixAll", {})
    vim.api.nvim_buf_create_user_command(0, "LspOrganizeImports", "TypescriptOrganizeImports", {})
    vim.api.nvim_buf_create_user_command(0, "LspRemoveUnused", "TypescriptRemoveUnused", {})
    vim.api.nvim_buf_create_user_command(0, "LspRenameFile", "TypescriptRenameFile", {})
  end,
}
