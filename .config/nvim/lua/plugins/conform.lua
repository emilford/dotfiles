return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
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
    format_on_save = function(bufnr)
      return {
        timeout_ms = 500,
        lsp_fallback = true,
        filter = function(client)
          return client.name ~= "tsserver"
        end,
      }
    end,
  },
  keys = {
    {
      "<leader>F",
      function()
        require("conform").format({
          timeout_ms = 500,
          lsp_fallback = true,
          filter = function(client)
            return client.name ~= "tsserver"
          end,
        })
      end,
      desc = "Format Document",
    },
  },
}
