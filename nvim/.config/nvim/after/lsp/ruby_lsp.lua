return {
  cmd = { "sh", "-c", "mise x -- ruby-lsp" },
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
