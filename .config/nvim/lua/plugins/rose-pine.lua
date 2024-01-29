return {
  "rose-pine/neovim",
  lazy = false,
  name = "rose-pine",
  priority = 1000,
  opts = {
    dark_variant = "moon",
    styles = {
      transparency = true,
    },
    highlight_groups = {
      ["@string.special.symbol.ruby"] = {
        fg = "foam",
      },
      LspInfoBorder = {
        fg = "highlight_med",
      },
      HarpoonBorder = {
        fg = "muted",
      },
      CodeActionBorder = {
        fg = "highlight_med",
      },
      RenameBorder = {
        fg = "highlight_med",
      },
    },
  },
  config = function(_, opts)
    require("rose-pine").setup(opts)

    vim.cmd("colorscheme rose-pine")
  end,
}
