return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local path = require("lazy.core.config").options.root .. "/nvim-lspconfig"
      vim.opt.runtimepath:prepend(path)
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        "css-lsp",
        "eslint-lsp",
        "json-lsp",
        "lua-language-server",
        "stimulus-language-server",
        "tailwindcss-language-server",
        "typescript-language-server",
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
