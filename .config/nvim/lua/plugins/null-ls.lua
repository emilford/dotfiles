return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim", "mason.nvim" },
  opts = function()
    local null_ls = require("null-ls")

    return {
      sources = {
        null_ls.builtins.diagnostics.actionlint,
        null_ls.builtins.diagnostics.erb_lint.with({
          condition = function(utils)
            return utils.root_has_file({ ".erb-lint.yml" })
          end,
        }),
        null_ls.builtins.diagnostics.fish,
        null_ls.builtins.diagnostics.gitlint,
        null_ls.builtins.diagnostics.tfsec,
        null_ls.builtins.diagnostics.vale.with({ extra_filetypes = { "gitcommit" } }),
        null_ls.builtins.formatting.erb_lint.with({
          condition = function(utils)
            return utils.root_has_file({ ".erb-lint.yml" })
          end,
        }),
        null_ls.builtins.formatting.fish_indent,
        null_ls.builtins.formatting.prettierd.with({
          condition = function(utils)
            return utils.root_has_file({
              ".prettierrc",
              ".prettierrc.json",
              ".prettierrc.yml",
              ".prettierrc.yaml",
              ".prettierrc.json5",
              ".prettierrc.js",
              ".prettierrc.cjs",
              ".prettierrc.toml",
              "prettier.config.js",
              "prettier.config.cjs",
            })
          end,
          prefer_local = "node_modules/.bin",
        }),
        null_ls.builtins.formatting.rustywind.with({ extra_filetypes = { "eruby" } }),
        null_ls.builtins.formatting.stylua,
      },
    }
  end,
}
