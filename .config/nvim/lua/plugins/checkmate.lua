return {
  {
    "bngarren/checkmate.nvim",
    ft = "markdown",
    opts = function()
      local rosepine = require("rose-pine.palette")

      return {
        files = { "notes/*.md" },
        todo_markers = {
          unchecked = "󰄱",
          checked = "󰱒",
        },
        keys = {
          ["<leader>tt"] = "toggle",
          ["<leader>tc"] = "create",
        },
        style = {
          checked_marker = { fg = rosepine.text },
          checked_main_content = { fg = rosepine.muted },
          unchecked_marker = { fg = rosepine.text },
          unchecked_main_content = { fg = rosepine.text },
        },
        show_todo_count = false,
      }
    end,
  },
}
