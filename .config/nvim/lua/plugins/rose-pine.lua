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
      ["@symbol.ruby"] = {
        fg = "foam",
      },
      FidgetTitle = {
        fg = "subtle",
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
      StatusLine = {
        bg = "highlight_low",
        fg = "muted",
      },
      StatusLineNC = {
        bg = "surface",
        fg = "muted",
      },
    },
  },
  config = function(_, opts)
    require("rose-pine").setup(opts)

    vim.cmd("colorscheme rose-pine")
  end,
}
