return {
  {
    "saghen/blink.compat",
    version = "*",
    config = true,
  },
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = { "L3MON4D3/LuaSnip" },
    event = { "CmdlineEnter", "InsertEnter" },
    opts = {
      appearance = {
        kind_icons = require("config.icons").kind_icons,
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = { border = "rounded" },
        },
        list = {
          selection = {
            preselect = false,
          },
        },
        menu = {
          border = "rounded",
          draw = {
            columns = { { "kind_icon" }, { "label" }, { "source_name" } },
            components = {
              kind_icon = {
                highlight = function() end,
              },
              source_name = {
                text = function(ctx)
                  return "(" .. ctx.source_name .. ")"
                end,
              },
            },
            gap = 2,
          },
        },
      },
      keymap = {
        ["<c-k>"] = { "snippet_forward", "fallback" },
        ["<c-j>"] = { "snippet_backward", "fallback" },
        cmdline = {
          preset = "default",
          ["<Tab>"] = { "select_and_accept", "fallback" },
        },
      },
      signature = {
        enabled = true,
        window = { border = "rounded" },
      },
      snippets = { preset = "luasnip" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "git", "dadbod" },
        providers = {
          dadbod = {
            name = "DB",
            module = "vim_dadbod_completion.blink",
            fallbacks = { "buffer" },
            enabled = function()
              return vim.o.filetype == "sql"
            end,
          },
          git = {
            name = "Git",
            module = "blink.compat.source",
            async = true,
            enabled = function()
              return vim.o.filetype == "gitcommit"
            end,
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
            enabled = function()
              return vim.o.filetype == "lua"
            end,
          },
        },
      },
    },
    opts_extend = { "sources.default" },
  },
  {
    "petertriho/cmp-git",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    ft = "gitcommit",
    opts = {
      github = {
        pull_requests = {
          state = "all",
        },
      },
    },
  },
  {
    "kristijanhusak/vim-dadbod-completion",
    ft = "sql",
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
  },
}
