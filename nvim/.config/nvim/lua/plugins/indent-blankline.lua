return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      exclude = {
        filetypes = {
          "fugitive",
          "markdown",
        },
      },
      indent = {
        char = require("config.icons").misc.vertical_bar,
      },
      scope = {
        enabled = false,
      },
    },
  },
}
