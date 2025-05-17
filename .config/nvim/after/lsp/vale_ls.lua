return {
  filetypes = vim.list_extend(require("lspconfig")["vale_ls"].config_def.default_config.filetypes, { "gitcommit" }),
}
