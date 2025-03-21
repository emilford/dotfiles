return {
  cmd = { "sh", "-c", "mise x -- ruby-lsp" },
  filetypes = { "ruby", "eruby" },
  root_markers = { "Gemfile" },
  init_options = {
    addonSettings = {
      ["Ruby LSP Rails"] = {
        enablePendingMigrationsPrompt = false,
      },
    },
    formatter = vim.fn.filereadable(".standard.yml") and "standard" or "auto",
    linters = { vim.fn.filereadable(".standard.yml") and "standard" or "auto" },
  },
}
