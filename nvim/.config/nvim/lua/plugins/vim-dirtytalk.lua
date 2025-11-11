return {
  {
    "psliwka/vim-dirtytalk",
    build = ":DirtytalkUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      vim.opt.spelllang:append("programming")
    end,
  },
}
