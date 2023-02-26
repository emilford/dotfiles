return {
  "rose-pine/neovim",
  lazy = false,
  name = "rose-pine",
  priority = 1000,
  opts = {
    dark_variant = "moon",
    disable_background = true,
    disable_float_background = true,
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
      CodeActionBorder = {
        fg = "highlight_med",
      },
      RenameBorder = {
        fg = "highlight_med",
      },
      StatusLine = {
        bg = "surface",
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
