return {
  {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    cmd = { "TSInstall", "TSInstallInfo", "TSUninstall", "TSUpdate" },
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "andymass/vim-matchup",
    },
    opts = {
      auto_install = true,
      endwise = {
        enable = true,
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
        disable = { "ruby" },
      },
      matchup = {
        enabled = true,
      },
    },
  },
  {
    "RRethy/nvim-treesitter-endwise",
    ft = { "bash", "fish", "lua", "ruby" },
  },
}
