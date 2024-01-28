return {
  "janko-m/vim-test",
  enabled = false,
  keys = {
    { "<leader>tn", ":TestNearest<cr>" },
    { "<leader>tf", ":TestFile<cr>" },
    { "<leader>ta", ":TestSuite<cr>" },
    { "<leader>tl", ":TestLast<cr>" },
    { "<leader>tv", ":TestVisit<cr>" },
  },
  dependencies = {
    "christoomey/vim-tmux-runner",
  },
  config = function()
    vim.g["test#strategy"] = "vtr"
  end,
}
