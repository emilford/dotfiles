return {
  "psliwka/vim-dirtytalk",
  build = ":DirtytalkUpdate",
  ft = { "gitcommit", "markdown" },
  config = function()
    vim.opt.spelllang:append("programming")
    vim.opt.rtp:append(vim.fn.stdpath("data") .. "/site")
  end,
}
