return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "b0o/schemastore.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  opts = function()
    return {
      diagnostics = {
        float = {
          border = "rounded",
          source = "always",
        },
        virtual_text = false,
        severity_sort = true,
      },
      icons = {
        diagnostics = {
          Error = "●",
          Hint = "○",
          Info = "●",
          Warn = "●",
        },
      },
      servers = {
        cssls = {
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
        },
        eslint = {},
        html = {
          filetypes = {
            "erb",
            "eruby",
            "html",
          },
        },
        jsonls = {
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              diagnostics = {
                globals = { "vim", "use" },
              },
              workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file("", true),
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },
        solargraph = {
          init_options = {
            formatting = false,
          },
          root_dir = require("lspconfig").util.root_pattern(".solargraph.yml"),
        },
        tailwindcss = {
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
        },
        yamlls = {},
      },
      setup = {
        -- example to setup with typescript.nvim
        -- tsserver = function(_, opts)
        --   require("typescript").setup({ server = opts })
        --   return true
        -- end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    }
  end,
  config = function(_, opts)
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        require("config.utils").on_attach(client, args.buf)
      end,
    })

    require("lspconfig.ui.windows").default_options.border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })

    vim.diagnostic.config(opts.diagnostics)
    for type, icon in pairs(opts.icons.diagnostics) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local available_servers = require("mason-lspconfig").get_available_servers()

    local function setup(server)
      local server_opts = vim.tbl_deep_extend("force", {
        capabilities = vim.deepcopy(capabilities),
      }, opts.servers[server] or {})

      if opts.setup[server] then
        if opts.setup[server](server, server_opts) then
          return
        end
      elseif opts.setup["*"] then
        if opts.setup["*"](server, server_opts) then
          return
        end
      end

      require("lspconfig")[server].setup(server_opts)
    end

    local ensure_installed = {}
    for server, server_opts in pairs(opts.servers) do
      server_opts = server_opts == true and {} or server_opts

      if server_opts.mason == false or not vim.tbl_contains(available_servers, server) then
        setup(server)
      else
        ensure_installed[#ensure_installed + 1] = server
      end
    end

    require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
    require("mason-lspconfig").setup_handlers({ setup })
  end,
}
