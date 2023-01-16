local M = {}

function M.config()
  require("lspsaga").setup({
    lightbulb = {
      virtual_text = false,
    },
    symbol_in_winbar = {
      enable = false,
    },
    ui = {
      border = "rounded",
      code_action = "◎",
    },
  })
end

return M
