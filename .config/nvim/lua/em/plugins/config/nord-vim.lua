local M = {}

function M.config()
  vim.g.nord_italic = 1

  -- https://github.com/arcticicestudio/nord-vim/issues/279
  vim.cmd([[autocmd ColorScheme nord :highlight erubyDelimiter ctermbg=5 guifg=#B48EAD]])

  -- https://www.reddit.com/r/neovim/comments/uhv6xs/is_it_possible_to_make_lsp_hover_windows/
  vim.cmd([[autocmd ColorScheme nord :highlight! link NormalFloat Normal]])

  vim.cmd([[colorscheme nord]])
end

return M
