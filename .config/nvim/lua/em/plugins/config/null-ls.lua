local M = {}

function M.config()
  local U = require("em.utils")
  local null_ls = require("null-ls")

  null_ls.setup({
    on_attach = U.on_attach,
    sources = {
      null_ls.builtins.diagnostics.erb_lint.with({
        condition = function(utils)
          return utils.root_has_file({ ".erb-lint.yml" })
        end,
      }),
      null_ls.builtins.diagnostics.gitlint,
      null_ls.builtins.diagnostics.standardrb,
      null_ls.builtins.diagnostics.vale.with({ extra_filetypes = { "gitcommit" } }),
      null_ls.builtins.formatting.erb_lint.with({
        condition = function(utils)
          return utils.root_has_file({ ".erb-lint.yml" })
        end,
      }),
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
      null_ls.builtins.formatting.standardrb,
      null_ls.builtins.formatting.stylua,
    },
  })
end

return M
