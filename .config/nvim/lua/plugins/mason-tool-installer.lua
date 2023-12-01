return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  event = "VeryLazy",
  dependecies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  opts = {
    ensure_installed = {
      "actionlint",
      "erb-lint",
      "gitlint",
      "luacheck",
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
