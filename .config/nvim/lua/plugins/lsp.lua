return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function()
          vim.keymap.set("i", "<c-s>", function()
            vim.lsp.buf.signature_help({ border = "rounded" })
          end, { desc = "vim.lsp.buf.signature_help()" })

          vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
          end, { desc = "vim.lsp.buf.definition()" })

          vim.keymap.set("n", "gt", function()
            vim.lsp.buf.type_definition()
          end, { desc = "vim.lsp.buf.type_definition()" })

          vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover({ border = "rounded" })
          end, { desc = "vim.lsp.buf.hover()" })
        end,
      })

      local diagnostic_signs = {}
      for _, type in ipairs({ "ERROR", "HINT", "INFO", "WARN" }) do
        diagnostic_signs[vim.diagnostic.severity[type]] = require("config.icons").misc.diagnostic
      end

      vim.diagnostic.config({
        float = {
          border = "rounded",
          source = true,
        },
        severity_sort = true,
        signs = { text = diagnostic_signs },
        virtual_text = false,
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason" },
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function()
      local servers = {
        jsonls = {
          settings = {
            json = {
              format = { enable = true },
              validate = { enable = true },
            },
          },
          on_new_config = function(config)
            config.settings.json.schemas = config.settings.json.schemas or {}
            vim.list_extend(config.settings.json.schemas, require("schemastore").json.schemas())
          end,
        },
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
        ruby_lsp = {
          cmd = { "sh", "-c", "mise x -- ruby-lsp" },
          init_options = {
            formatter = "standard",
            linters = { "standard" },
          },
        },
        vale_ls = {
          filetypes = {
            "markdown",
            "gitcommit",
          },
        },
        yamlls = {
          settings = {
            yaml = {
              format = {
                enable = true,
              },
              schemaStore = {
                enable = false,
                url = "",
              },
              validate = true,
            },
          },
          on_new_config = function(config)
            config.settings.yaml.schemas = config.settings.yaml.schemas or {}
            vim.list_extend(config.settings.yaml.schemas, require("schemastore").json.schemas())
          end,
        },
      }

      return {
        ensure_installed = vim.tbl_keys(servers),
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}

            server.capabilities = require("blink.cmp").get_lsp_capabilities(server.capabilities or {})

            require("lspconfig")[server_name].setup(server)
          end,
        },
      }
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "b0o/SchemaStore.nvim",
    version = false,
  },
}
