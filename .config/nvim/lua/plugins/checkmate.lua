return {
  {
    "bngarren/checkmate.nvim",
    ft = "markdown",
    opts = function()
      local rosepine = require("rose-pine.palette")
      local icons = require("config.icons")

      return {
        notify = false,
        files = { "notes/*.md" },
        todo_markers = icons.todo_markers,
        style = {
          CheckmateCheckedMarker = { fg = rosepine.text },
          CheckmateCheckedMainContent = { fg = rosepine.muted },
          CheckmateUncheckedMarker = { fg = rosepine.text },
          CheckmateUncheckedMainContent = { fg = rosepine.text },
        },
        show_todo_count = false,
      }
    end,
  },
}
