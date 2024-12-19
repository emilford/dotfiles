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
        ["CodeActionBorder"] = { fg = "highlight_med" },
        ["LspInfoBorder"] = { fg = "highlight_med" },
        ["RenameBorder"] = { fg = "highlight_med" },
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
