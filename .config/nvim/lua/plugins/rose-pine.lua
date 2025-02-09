return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = {
      dark_variant = "moon",
      highlight_groups = {
        ["@string.special.symbol.ruby"] = { fg = "foam" },
        ["Pmenu"] = { link = "FloatBorder" },
      },
      styles = {
        transparency = true,
      },
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)

      vim.cmd([[colorscheme rose-pine]])
    end,
  },
}
