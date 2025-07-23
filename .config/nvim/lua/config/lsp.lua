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
})

vim.lsp.config("*", { root_markers = { ".git" } })
vim.lsp.enable({
  "angularls",
  "cssls",
  "eslint",
  "jsonls",
  "lua_ls",
  "ruby_lsp",
  "stimulus_ls",
  "tailwindcss",
  "vale_ls",
  "vtsls",
  "yamlls",
})
