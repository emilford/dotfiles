return {
  "christoomey/vim-tmux-runner",
  keys = {
    { "<leader>ra", ":VtrAttachToPane<cr>" },
    { "<leader>rc", ":VtrClearRunner<cr>" },
    { "<leader>rf", ":VtrFocusRunner<cr>" },
    { "<leader>ro", ":VtrOpenRunner<cr>" },
    { "<leader>rk", ":VtrKillRunner<cr>" },
  },
  init = function()
    vim.g.VtrOrientation = "h"
    vim.g.VtrPercentage = 35
  end
}
