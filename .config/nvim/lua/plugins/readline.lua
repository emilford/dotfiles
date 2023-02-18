return {
  "ryvnf/readline.vim",
  event = "CmdlineEnter",
  config = function()
    vim.g.readline_ctrl_t = 0
  end,
}
