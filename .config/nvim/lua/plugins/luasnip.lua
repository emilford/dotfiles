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
  keys = {
    {
      "<tab>",
      function()
        return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
      end,
      expr = true,
      silent = true,
      mode = "i",
    },
    {
      "<tab>",
      function()
        require("luasnip").jump(1)
      end,
      mode = "s",
    },
    {
      "<s-tab>",
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
