return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        "eslint-lsp",
        "json-lsp",
        "lua-language-server",
        "stimulus-language-server",
        "tailwindcss-language-server",
        "vale-ls",
        "yaml-language-server",
      })
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "b0o/SchemaStore.nvim",
    version = false,
  },
}
