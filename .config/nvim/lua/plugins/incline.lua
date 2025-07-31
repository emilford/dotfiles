return {
  {
    "b0o/incline.nvim",
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    opts = function()
      return {
        window = {
          margin = { horizontal = 0 },
          overlap = { statusline = true },
          padding = 0,
          placement = { vertical = "bottom" },
        },
        render = function(props)
          local filename = require("utils").shorten_path(vim.api.nvim_buf_get_name(props.buf), { short_len = 2 })
          local rosepine = require("rose-pine.palette")

          return {
            { " ", guibg = props.focused and rosepine.rose or rosepine.highlight_high },
            " ",
            { filename == "" and "[No Name]" or filename },
            vim.api.nvim_get_option_value("modified", {}) and require("config.icons").misc.modified or "",
            " ",
          }
        end,
      }
    end,
  },
}
