return {
  {
    "stevearc/conform.nvim",
    cmd = { "ConformInfo" },
    event = { "BufWritePre" },
    opts = {
      formatters_by_ft = {
        ["lua"] = { "stylua" },
      },
      format_on_save = {
        lsp_format = "fallback",
      },
    },
  },
}
