local M = {}

function M.config()
  vim.g.nord_italic = 1

  -- https://github.com/arcticicestudio/nord-vim/issues/279
  vim.cmd([[autocmd ColorScheme nord :highlight erubyDelimiter ctermbg=5 guifg=#B48EAD]])

  -- https://www.reddit.com/r/neovim/comments/uhv6xs/is_it_possible_to_make_lsp_hover_windows/
  vim.cmd([[autocmd ColorScheme nord :highlight! link NormalFloat Normal]])

  local nord = require("em.themes.nord.palette")

  local highlight = function(group, arguments)
    arguments.style = arguments.style and "gui=" .. arguments.style or "gui=NONE"
    arguments.fg = arguments.fg and "guifg=" .. arguments.fg or "guifg=NONE"
    arguments.bg = arguments.bg and "guibg=" .. arguments.bg or "guibg=NONE"
    arguments.sp = arguments.sp and "guisp=" .. arguments.sp or ""

    vim.cmd(
      "autocmd ColorScheme nord :highlight "
        .. group
        .. " "
        .. arguments.style
        .. " "
        .. arguments.fg
        .. " "
        .. arguments.bg
        .. " "
        .. arguments.sp
    )
  end

  highlight("CmpItemAbbr", { fg = nord.gui.nord4 })
  highlight("CmpItemAbbrMatch", { fg = nord.gui.nord7, style = "bold" })
  highlight("CmpItemAbbrMatchFuzzy", { fg = nord.gui.nord7, style = "bold" })
  highlight("CmpItemKind", { fg = nord.gui.nord15 })
  highlight("CmpItemMenu", { fg = nord.gui.nord14 })

  vim.cmd([[colorscheme nord]])
end

return M
