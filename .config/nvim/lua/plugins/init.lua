local utils = require("config.utils")

return {
  { "christoomey/vim-sort-motion" },
  { "christoomey/vim-system-copy" },
  { "christoomey/vim-tmux-navigator" },
  { "dhruvasagar/vim-zoom" },
  { "ervandew/supertab" },
  { "fladson/vim-kitty" },
  { "keith/rspec.vim" },
  { "khaveesh/vim-fish-syntax" },
  { "nvim-lua/plenary.nvim" },
  { "pbrisbin/vim-mkdir" },
  { "qalshidi/vim-bettergrep" },
  { "ray-x/lsp_signature.nvim" },
  {
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
  },
  {
    "romainl/vim-qf",
    event = "VeryLazy",
    init = function()
      vim.g.qf_auto_open_quickfix = 1
      vim.g.qf_auto_resize = 0
      vim.g.qf_nowrap = 1
      vim.g.qf_shorten_path = 1
    end,
  },
  { "shumphrey/fugitive-gitlab.vim" },
  { "tommcdo/vim-exchange" },
  { "tpope/vim-abolish" },
  { "tpope/vim-bundler" },
  { "tpope/vim-eunuch" },
  { "tpope/vim-git" },
  { "tpope/vim-heroku" },
  { "tpope/vim-rails" },
  { "tpope/vim-rake" },
  { "tpope/vim-repeat" },
  { "tpope/vim-rhubarb" },
  { "tpope/vim-sleuth" },
  { "tpope/vim-unimpaired" },
  { "tpope/vim-vinegar" },
}
