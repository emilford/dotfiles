return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    keys = {
      {
        "<c-j>",
        function()
          return require("luasnip").expand_or_jumpable() and "<Plug>luasnip-expand-or-jump" or "<c-j>"
        end,
        expr = true,
        silent = true,
        mode = { "i", "s" },
      },
      {
        "<c-k>",
        function()
          return require("luasnip").jumpable(-1) and "<Plug>luasnip-jump-next" or "<c-k>"
        end,
        expr = true,
        silent = true,
        mode = { "i", "s" },
      },
      {
        "<c-n>",
        function()
          return require("luasnip").choice_active() and "<Plug>luasnip-next-choice" or "<c-n>"
        end,
        expr = true,
        silent = true,
        mode = { "i", "s" },
      },
      {
        "<c-p>",
        function()
          return require("luasnip").choice_active() and "<Plug>luasnip-prev-choice" or "<c-p>"
        end,
        expr = true,
        silent = true,
        mode = { "i", "s" },
      },
    },
    opts = function()
      local types = require("luasnip.util.types")
      return {
        delete_check_events = "TextChanged",
        ext_opts = {
          [types.choiceNode] = {
            active = {
              virt_text = { { "", "Comment" } },
              hl_mode = "combine",
            },
          },
        },
        history = true,
        update_events = "TextChanged,TextChangedI",
      }
    end,
    config = function(_, opts)
      require("luasnip").setup(opts)
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
    end,
  },
}
