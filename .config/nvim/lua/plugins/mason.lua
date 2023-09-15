return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  opts = {
    ui = {
      border = "rounded",
    },
    ensure_installed = {
      "actionlint",
      "erb-lint",
      "gitlint",
      "prettierd",
      "rustywind",
      "stylua",
      "tfsec",
      "vale",
    },
  },
}
