return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      ["terraform-vars"] = { "tflint", "tfsec" },
      eruby = { "erb_lint" },
      fish = { "fish" },
      gitcommit = { "gitlint", "vale" },
      lua = { "luacheck" },
      markdown = { "vale" },
      terraform = { "tflint", "tfsec" },
      tf = { "tfsec" },
      yaml = { "actionlint" },
    }

    vim.api.nvim_create_augroup("nvim-lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = "nvim-lint",
      callback = function()
        local linters = lint._resolve_linter_by_ft(vim.bo.filetype)

        if #linters > 0 then
          lint.try_lint(linters)
        end
      end,
    })
  end,
}
