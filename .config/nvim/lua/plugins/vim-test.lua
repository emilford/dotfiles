return {
  "emilford/vim-test",
  cmd = {
    "TestNearest",
    "TestFile",
    "TestSuite",
    "TestLast",
  },
  keys = {
    { "<leader>tn", ":TestNearest<cr>", desc = "Run nearest test" },
    { "<leader>tf", ":TestFile<cr>", desc = "Run tests in file" },
    { "<leader>ta", ":TestSuite<cr>", desc = "Run all tests" },
    { "<leader>tl", ":TestLast<cr>", desc = "Run last test" },
  },
  init = function()
    vim.g["test#custom_strategies"] = {
      wezterm_wrapped = function(cmd)
        vim.fn["test#strategy#wezterm"]("clear; " .. cmd .. "\n")

        local pane_id = vim.g["test#wezterm#pane_id"]
        vim.g["test#wezterm#pane_id"] = nil

        vim.keymap.set("n", "<leader>tk", function()
          vim.cmd("!wezterm cli kill-pane --pane-id " .. pane_id, { silent = true })
        end, { desc = "Close test runner" })
      end,
    }

    -- https://github.com/vim-test/vim-test/pull/796
    vim.g["test#wezterm#split_percent"] = 30
    vim.g["test#strategy"] = "wezterm_wrapped"
  end,
}
