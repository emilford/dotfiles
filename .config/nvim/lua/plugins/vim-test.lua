return {
  "janko-m/vim-test",
  cmd = {
    "TestNearest",
    "TestFile",
    "TestSuite",
    "TestLast",
  },
  keys = {
    { "<leader>Tn", ":TestNearest<cr>" },
    { "<leader>Tf", ":TestFile<cr>" },
    { "<leader>Ta", ":TestSuite<cr>" },
    { "<leader>Tl", ":TestLast<cr>" },
  },
  init = function()
    vim.g["test#strategy"] = "kitty"
  end,
}
