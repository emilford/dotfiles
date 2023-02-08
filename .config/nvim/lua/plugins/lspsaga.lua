return {
  "glepnir/lspsaga.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
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
