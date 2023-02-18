local utils = require("config.utils")

return {
  {
    "christoomey/vim-sort-motion",
    keys = {
      { "gs", mode = { "n", "v" } },
    },
  },
  {
    "christoomey/vim-system-copy",
    keys = {
      { "cp", mode = { "n", "v" } },
      { "cv", mode = { "n", "v" } },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<c-h>", desc = "Move left" },
      { "<c-j>", desc = "Move down" },
      { "<c-k>", desc = "Move up" },
      { "<c-l>", desc = "Move right" },
      { "<c-\\>", desc = "Move to previous" },
    },
  },
  {
    "dhruvasagar/vim-zoom",
    keys = { "<c-w>m" },
  },
  { "ervandew/supertab" },
  {
    "fladson/vim-kitty",
    ft = "kitty",
  },
  { "keith/rspec.vim" },
  {
    "khaveesh/vim-fish-syntax",
    ft = "fish",
  },
  { "pbrisbin/vim-mkdir" },
  {
    "qalshidi/vim-bettergrep",
    cmd = {
      "Grep",
      "Grepadd",
      "LGrep",
      "LGrepadd",
    },
    keys = {
      "<c-g>",
      "<m-g>",
    },
  },
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
  {
    "tommcdo/vim-exchange",
    keys = {
      { "cx", mode = { "n" } },
      { "cxx", mode = { "n" } },
      { "X", mode = { "v" } },
      { "cxc", mode = { "n" } },
    },
  },
  {
    "tpope/vim-abolish",
    cmd = {
      "Abolish",
      "Subvert",
      "S",
    },
  },
  {
    "tpope/vim-bundler",
    cmd = {
      "Bundle",
      "Bopen",
      "Bedit",
      "Bsplit",
      "Bvsplit",
      "Btabedit",
      "Bpedit",
    },
  },
  {
    "tpope/vim-eunuch",
    cmd = {
      "Cfind",
      "Chmod",
      "Clocate",
      "Copy",
      "Delete",
      "Duplicate",
      "Lfind",
      "Llocate",
      "Mkdir",
      "Move",
      "Remove",
      "Rename",
      "SudoEdit",
      "SudoWrite",
      "Unlink",
      "W",
      "Wall",
    },
  },
  {
    "tpope/vim-git",
    cmd = {
      "Cycle",
      "Drop",
      "Edit",
      "Fixup",
      "Pick",
      "Reword",
      "Squash",
    },
  },
  { "tpope/vim-heroku" },
  {
    "tpope/vim-rails",
  },
  {
    "tpope/vim-rake",
    cmd = {
      "A",
      "AD",
      "AS",
      "AT",
      "AV",
      "Cd",
      "Ctags",
      "Elib",
      "Espec",
      "Etask",
      "Etest",
      "Lcd",
      "Rake",
    },
  },
  { "tpope/vim-repeat" },
  { "tpope/vim-sleuth" },
  { "tpope/vim-unimpaired" },
  {
    "tpope/vim-vinegar",
    ft = "netrw",
  },
}
