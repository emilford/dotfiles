return {
  "Wansmer/treesj",
  dependencies = {
    "nvim-treesitter",
  },
  keys = {
    { "gS", "<cmd>TSJSplit<cr>" },
    { "gJ", "<cmd>TSJJoin<cr>" },
  },
  opts = {
    use_default_keymaps = false,
  },
}
