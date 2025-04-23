return {
  {
    "b0o/incline.nvim",
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    opts = function()
      return {
        hide = { cursorline = "focused_win" },
        window = {
          margin = { horizontal = 0 },
          padding = 0,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local rosepine = require("rose-pine.palette")

          return {
            { " ", guibg = props.focused and rosepine.rose or rosepine.highlight_high },
            " ",
            { filename == "" and "[No Name]" or filename },
            { " ♥ " },
          }
        end,
      }
    end,
  },
}
