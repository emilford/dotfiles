return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
      end,
    },
  },
  opts = {
    delete_check_events = "TextChanged",
    enable_autosnippets = true,
    history = true,
    update_events = "TextChanged,TextChangedI",
  },
  keys = function()
    local luasnip = require("luasnip")

    return {
      {
        "<c-k>",
        function()
          return luasnip.expand_or_jumpable() and luasnip.expand_or_jump() or "<c-k>"
        end,
        expr = true,
        silent = true,
        mode = { "i", "s" },
      },
      {
        "<c-j>",
        function()
          return luasnip.jumpable(-1) and luasnip.jump(-1) or "<c-j>"
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
    }
  end,
}
