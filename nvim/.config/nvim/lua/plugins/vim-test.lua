return {
  {
    "vim-test/vim-test",
    cmd = {
      "TestNearest",
      "TestFile",
      "TestSuite",
      "TestLast",
    },
    keys = {
      { "<leader>tn", "<cmd>TestNearest<cr>", desc = "Run nearest test" },
      { "<leader>tf", "<cmd>TestFile<cr>", desc = "Run tests in file" },
      { "<leader>ta", "<cmd>TestSuite<cr>", desc = "Run all tests" },
      { "<leader>tl", "<cmd>TestLast<cr>", desc = "Run last test" },
    },
    config = function()
      vim.g["test#custom_strategies"] = {
        wezterm_wrapped = function(cmd)
          vim.fn["test#strategy#wezterm"]("clear; " .. cmd .. "\n")

          local pane_id = vim.g["test#wezterm#pane_id"]
          vim.g["test#wezterm#pane_id"] = nil

          vim.keymap.set("n", "<leader>tk", function()
            vim.cmd("!wezterm cli kill-pane --pane-id " .. pane_id, { silent = true })
          end, { desc = "Close test runner" })

          vim.keymap.set("n", "<leader>tz", function()
            vim.cmd("!wezterm cli zoom-pane --zoom --pane-id " .. pane_id, { silent = true })
          end, { desc = "Zoom test runner" })
        end,
      }

      vim.g["test#wezterm#split_percent"] = 30
      vim.g["test#strategy"] = "wezterm_wrapped"
    end,
  },
}
