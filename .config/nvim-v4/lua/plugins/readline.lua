return {
  "ryvnf/readline.vim",
  event = "CmdlineEnter",
  init = function()
    vim.g.readline_ctrl_t = 0
  end,
}
