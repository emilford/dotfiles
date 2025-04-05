return {
  {
    "saghen/blink.compat",
    version = "*",
    config = true,
  },
  {
    "saghen/blink.cmp",
    version = "*",
    event = { "CmdlineEnter", "InsertEnter" },
    opts = {
      appearance = {
        kind_icons = require("config.icons").kind_icons,
      },
      cmdline = {
        completion = {
          menu = {
            auto_show = true,
          },
        },
        keymap = {
          ["<Tab>"] = { "select_and_accept", "fallback" },
        },
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        list = {
          selection = {
            preselect = false,
          },
        },
        menu = {
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
      },
      signature = {
        enabled = true,
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
            module = "blink-cmp-git",
            score_offset = 100,
            opts = {
              git_centers = {
                github = {
                  pull_request = {
                    get_command_args = function(command, token)
                      local args = require("blink-cmp-git.default.github").issue.get_command_args(command, token)
                      local utils = require("blink-cmp-git.utils")

                      args[#args] = "repos/"
                        .. utils.get_repo_owner_and_repo()
                        .. "/pulls?state=all&per_page=100&sort=updated&direction=desc"

                      return args
                    end,
                  },
                },
              },
              kind_icons = require("config.icons").kind_icons,
            },
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
    "L3MON4D3/LuaSnip",
    cmd = { "InsertEnter" },
  },
  {
    "Kaiser-Yang/blink-cmp-git",
    dependencies = { "nvim-lua/plenary.nvim" },
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
