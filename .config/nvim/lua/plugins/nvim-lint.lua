return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("lint").linters_by_ft = {
      ["terraform-vars"] = { "tflint", "tfsec" },
      eruby = { "erb_lint" },
      fish = { "fish" },
      gitcommit = { "gitlint", "vale" },
      javascript = { "eslint" },
      lua = { "luacheck" },
      markdown = { "vale" },
      terraform = { "tflint", "tfsec" },
      tf = { "tfsec" },
      typescript = { "eslint" },
      yaml = { "actionlint" },
    }

    vim.api.nvim_create_augroup("nvim-lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = "nvim-lint",
      pattern = {
        "*.erb",
        "*.fish",
        "*.js",
        "*.lua",
        "*.md",
        "*.ts",
        "*.tf",
        "*.tfvars",
        "*.tfvars.json",
        "*.tf.json",
        "*.yaml",
        "*.yml",
        "*COMMIT_EDITMSG", -- really filetype=gitcommit
      },
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
