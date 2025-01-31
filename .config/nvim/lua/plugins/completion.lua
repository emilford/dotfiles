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
            columns = function(ctx)
              return ctx.mode == "cmdline" and { { "kind_icon" }, { "label" } }
                or { { "kind_icon" }, { "label" }, { "source_name" } }
            end,
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
        per_filetype = {
          ["lua"] = { "lazydev", "lsp", "path", "buffer" },
          ["sql"] = { "dadbod", "buffer" },
          ["gitcommit"] = { "git", "snippets", "path", "buffer" },
        },
        providers = {
          dadbod = {
            name = "DB",
            module = "vim_dadbod_completion.blink",
            score_offset = 100,
          },
          git = {
            name = "Git",
            module = "blink.compat.source",
            async = true,
            score_offset = 100,
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
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
