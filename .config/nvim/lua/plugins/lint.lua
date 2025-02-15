return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("lint").linters_by_ft = {
        ["eruby"] = { "erb_lint" },
        ["fish"] = { "fish" },
        ["ghaction"] = { "actionlint" },
        ["gitcommit"] = { "gitlint" },
      }

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = "CustomAutoCommands",
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        "actionlint",
        "erb-lint",
        "gitlint",
        "vale",
      })
    end,
  },
}
