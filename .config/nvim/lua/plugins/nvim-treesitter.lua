return {
  {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    cmd = { "TSInstall", "TSInstallInfo", "TSUninstall", "TSUpdate" },
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "RRethy/nvim-treesitter-endwise",
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
}
