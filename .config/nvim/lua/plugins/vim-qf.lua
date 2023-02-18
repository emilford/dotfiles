return {
  "romainl/vim-qf",
  event = "VeryLazy",
  init = function()
    vim.g.qf_auto_open_quickfix = 1
    vim.g.qf_auto_resize = 0
    vim.g.qf_nowrap = 1
    vim.g.qf_shorten_path = 1
  end,
}
