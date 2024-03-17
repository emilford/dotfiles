return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
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
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end

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
  init = function()
    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, { desc = "Disable format on save", nargs = 0, bang = true })

    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, { desc = "Enable format on save", nargs = 0 })
  end,
}
