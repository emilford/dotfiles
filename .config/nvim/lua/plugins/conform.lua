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
      css = { "prettierd" },
      html = { "prettierd", "rustywind" },
      eruby = { "rustywind" },
      fish = { "fish_indent" },
      graphql = { "prettierd" },
      handlebars = { "prettierd" },
      javascript = { "prettierd", "rustywind" },
      javascriptreact = { "prettierd", "rustywind" },
      json = { "prettierd" },
      jsonc = { "prettierd" },
      less = { "prettierd" },
      lua = { "stylua" },
      luau = { "stylua" },
      markdown = { "prettierd" },
      ["markdown.mdx"] = { "prettierd" },
      scss = { "prettierd" },
      sql = { "sqlfmt" },
      terraform = { "terraform_fmt" },
      ["terraform-vars"] = { "terraform_fmt" },
      tf = { "terraform_fmt" },
      typescript = { "prettierd", "rustywind" },
      typescriptreact = { "prettierd", "rustywind" },
      vue = { "prettierd", "rustywind" },
      yaml = { "prettierd" },
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
