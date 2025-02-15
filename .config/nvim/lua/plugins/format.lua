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
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        "stylua",
      })
    end,
  },
}
