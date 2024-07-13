return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>F",
      function()
        require("conform").format({ lsp_format = "fallback" })
      end,
      desc = "Format Document",
    },
  },
  opts = {
    formatters_by_ft = {
      css = { { "prettierd", "prettier" } },
      html = { { "prettierd", "prettier" }, "rustywind" },
      eruby = { "rustywind" },
      fish = { "fish_indent" },
      graphql = { { "prettierd", "prettier" } },
      handlebars = { { "prettierd", "prettier" } },
      javascript = { { "prettierd", "prettier" }, "rustywind" },
      javascriptreact = { { "prettierd", "prettier" }, "rustywind" },
      json = { { "prettierd", "prettier" } },
      jsonc = { { "prettierd", "prettier" } },
      less = { { "prettierd", "prettier" } },
      lua = { "stylua" },
      luau = { "stylua" },
      markdown = { { "prettierd", "prettier" } },
      ["markdown.mdx"] = { { "prettierd", "prettier" } },
      scss = { { "prettierd", "prettier" } },
      sql = { "sqlfmt" },
      terraform = { "terraform_fmt" },
      ["terraform-vars"] = { "terraform_fmt" },
      tf = { "terraform_fmt" },
      typescript = { { "prettierd", "prettier" }, "rustywind" },
      typescriptreact = { { "prettierd", "prettier" }, "rustywind" },
      vue = { { "prettierd", "prettier" }, "rustywind" },
      yaml = { { "prettierd", "prettier" } },
    },
    formatters = {
      rustywind = {
        prepend_args = {
          "--custom-regex",
          "\\bclass[:=]\\s*['\"]([^'\"]*)['\"]",
        },
      },
    },
    format_on_save = {
      lsp_format = "fallback",
    },
  },
}
