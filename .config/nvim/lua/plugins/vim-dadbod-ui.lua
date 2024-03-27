return {
  cmd = "DBUI",
  "emilford/vim-dadbod-ui",
  branch = "vim.notify-log-levels",
  dependencies = {
    "tpope/vim-dadbod",
  },
  init = function()
    vim.g.db_ui_use_nvim_notify = 1
  end,
}
