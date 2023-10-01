return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  event = "VeryLazy",
  dependecies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  opts = {
    ensure_installed = {
      "erb-lint",
      "gitlint",
      "prettierd",
      "rustywind",
      "standardrb",
      "stylua",
      "tfsec",
      "vale",
      "zk",
    },
  },
}
