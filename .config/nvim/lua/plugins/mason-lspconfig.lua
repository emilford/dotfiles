return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "b0o/schemastore.nvim",
    "olrtg/emmet-language-server",
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
  },
  opts = {
    ensure_installed = {
      "cssls",
      "emmet_language_server",
      "eslint",
      "html",
      "jsonls",
      "lua_ls",
      "solargraph",
      "standardrb",
      "stimulus_ls",
      "tailwindcss",
      "terraformls",
      "tflint",
      "yamlls",
    },
    handlers = {
      function(server)
        require("lspconfig")[server].setup({})
      end,
      cssls = function()
        require("lspconfig").cssls.setup({
          filetypes = {
            "css",
            "erb",
            "eruby",
            "html",
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "less",
            "scss",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
            "vue",
          },
        })
      end,
      jsonls = function()
        require("lspconfig").jsonls.setup({
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        })
      end,
      lua_ls = function()
        require("lspconfig").lua_ls.setup({
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
      solargraph = function()
        require("lspconfig").solargraph.setup({
          init_options = {
            formatting = false,
          },
          root_dir = require("lspconfig").util.root_pattern(".solargraph.yml"),
        })
      end,
      tailwindcss = function()
        require("lspconfig").tailwindcss.setup({
          root_dir = require("lspconfig").util.root_pattern(
            "config/tailwind.config.js",
            "tailwind.config.js",
            "tailwind.config.ts",
            "postcss.config.js",
            "postcss.config.ts",
            "package.json",
            "node_modules",
            ".git"
          ),
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  "\\bclass:\\s*'([^']*)'",
                  '\\bclass:\\s*"([^"]*)"',
                },
              },
            },
          },
        })
      end,
      yamlls = function()
        require("lspconfig").yamlls.setup({
          settings = {
            redhat = {
              telemetry = {
                enabled = false,
              },
            },
            yaml = {
              format = {
                enable = true,
              },
              schemas = require("schemastore").json.schemas(),
            },
          },
        })
      end,
    },
  },
}
