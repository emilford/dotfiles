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
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          end
        end,
        expr = true,
        silent = true,
        mode = { "i", "s" },
      },
      {
        "<c-j>",
        function()
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          end
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
