return {
  {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    cmd = { "TSInstall", "TSInstallInfo", "TSUninstall", "TSUpdate" },
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "andymass/vim-matchup",
      "metiulekm/nvim-treesitter-endwise",
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
