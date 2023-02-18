return {
  "gbprod/nord.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    errors = { mode = "fg" },
    on_highlights = function(highlights, colors)
      highlights["FidgetTitle"] = { fg = colors.frost.artic_water }
      highlights["FidgetTask"] = { fg = colors.snow_storm.origin }
    end,
  },
  config = function(_, opts)
    require("nord").setup(opts)

    vim.cmd("colorscheme nord")
  end,
}
