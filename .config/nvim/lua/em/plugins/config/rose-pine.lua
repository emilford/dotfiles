local M = {}

function M.config()
  require("rose-pine").setup({
    dark_variant = "moon",
    disable_background = true,
    disable_float_background = true,
    highlight_groups = {
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
  })

  vim.cmd("highlight FidgetTitle ctermfg=110 guifg=#6cb6eb")
  vim.cmd("colorscheme rose-pine")
end

return M
