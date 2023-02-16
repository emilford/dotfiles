return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  opts = {
    delete_check_events = "TextChanged",
    enable_autosnippets = true,
    history = true,
    update_events = "TextChanged,TextChangedI",
  },
  keys = {
    {
      "<c-j>",
      function()
        return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<c-j>"
      end,
      expr = true,
      silent = true,
      mode = "i",
    },
    {
      "<c-j>",
      function()
        require("luasnip").jump(1)
      end,
      mode = "s",
    },
    {
      "<c-k>",
      function()
        require("luasnip").jump(-1)
      end,
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
}
