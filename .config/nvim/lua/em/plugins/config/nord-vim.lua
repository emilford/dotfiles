local M = {}

function M.config()
  vim.g.nord_italic = 1

  -- https://github.com/arcticicestudio/nord-vim/issues/279
  vim.cmd([[autocmd ColorScheme nord :highlight erubyDelimiter ctermbg=5 guifg=#B48EAD]])

  vim.cmd([[colorscheme nord]])
end

return M
