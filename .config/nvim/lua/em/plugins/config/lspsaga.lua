local M = {}

function M.config()
  require("lspsaga").init_lsp_saga({
    border_style = "rounded",
    code_action_icon = "◎ ",
    code_action_lightbulb = {
      virtual_text = false,
    },
  })
end

return M
