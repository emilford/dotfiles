return {
  {
    "Wansmer/treesj",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "gJ", "<cmd>TSJJoin<cr>", desc = "Join code block" },
      { "gS", "<cmd>TSJSplit<cr>", desc = "Split code block" },
    },
    opts = {
      use_default_keymaps = false,
    },
  },
}
