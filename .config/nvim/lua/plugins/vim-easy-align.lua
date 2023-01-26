return {
  "junegunn/vim-easy-align",
  -- TODO: Other events?
  event = { "BufNewFile", "BufReadPost" },
  keys = {
    { "<enter>", "<plug>(EasyAlign)", { mode = "v" } },
    { "ga", "<plug>(EasyAlign)" },
  },
}
