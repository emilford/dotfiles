return {
  "tpope/vim-dadbod",
  cmd = "DB",
  keys = {
    { "<c-q>", "db#op_exec()", expr = true, mode = { "n", "x" } },
  },
}
