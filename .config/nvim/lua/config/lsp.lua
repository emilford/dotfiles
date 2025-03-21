local icon = require("config.icons").misc.diagnostic
vim.diagnostic.config({
  float = { source = true },
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icon,
      [vim.diagnostic.severity.WARN] = icon,
      [vim.diagnostic.severity.INFO] = icon,
      [vim.diagnostic.severity.HINT] = icon,
    },
  },
  virtual_text = false,
})

vim.lsp.config("*", { root_markers = { ".git" } })
vim.lsp.enable({ "jsonls", "lua_ls", "ruby_lsp", "stimulus_ls", "vale_ls", "yamlls" })
