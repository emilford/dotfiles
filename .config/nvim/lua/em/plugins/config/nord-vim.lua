local M = {}

function M.config()
  vim.g.nord_italic = 1

  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "nord",
    callback = function()
      local nord = require("em.themes.nord.palette")

      -- https://github.com/arcticicestudio/nord-vim/issues/279
      vim.api.nvim_set_hl(0, "erubyDelimiter", { ctermfg = 5, fg = "#B48EAD" })

      -- https://www.reddit.com/r/neovim/comments/uhv6xs/is_it_possible_to_make_lsp_hover_windows/
      vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })

      vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = nord.gui.nord4 })
      vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = nord.gui.nord9, bold = true })
      vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = nord.gui.nord9, bold = true })
      vim.api.nvim_set_hl(0, "CmpItemKind", { fg = nord.gui.nord15 })
      vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = nord.gui.nord14 })

      vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "FloatBorder" })

      vim.api.nvim_set_hl(0, "LspSagaBorderTitle", { fg = nord.gui.nord4 })
      vim.api.nvim_set_hl(0, "LspSagaCodeActionBorder", { link = "FloatBorder" })
      vim.api.nvim_set_hl(0, "LspSagaCodeActionContent", { fg = nord.gui.nord4 })
      vim.api.nvim_set_hl(0, "LspSagaCodeActionTitle", { fg = nord.gui.nord5 })
      vim.api.nvim_set_hl(0, "LspSagaRenameBorder", { link = "FloatBorder" })

      vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = nord.gui.nord9, bold = true })
      vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "FloatBorder" })
      vim.api.nvim_set_hl(0, "TelescopePromptCounter", { fg = nord.gui.nord3 })
      vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { link = "TelescopeNormal" })
      vim.api.nvim_set_hl(0, "TelescopeSelection", { link = "PmenuSel" })
      vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = nord.gui.nord3 })

      vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = nord.gui.nord1 })
    end,
  })

  vim.cmd([[colorscheme nord]])
end

return M
