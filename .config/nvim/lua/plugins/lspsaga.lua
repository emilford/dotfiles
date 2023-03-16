return {
  "glepnir/lspsaga.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    diagnostic = {
      on_insert = false,
    },
    lightbulb = {
      virtual_text = false,
    },
    symbol_in_winbar = {
      enable = false,
    },
    ui = {
      border = "rounded",
      code_action = "◎",
    },
  },
}
