return {
  "janko-m/vim-test",
  dependencies = {
    "akinsho/toggleterm.nvim",
  },
  cmd = {
    "TestNearest",
    "TestFile",
    "TestSuite",
    "TestLast",
  },
  keys = {
    { "<leader>tn", ":TestNearest<cr>" },
    { "<leader>tf", ":TestFile<cr>" },
    { "<leader>ta", ":TestSuite<cr>" },
    { "<leader>tl", ":TestLast<cr>" },
  },
  init = function()
    vim.g["test#custom_strategies"] = {
      toggleterm = function(cmd)
        local terminal = require("toggleterm.terminal").Terminal:new({ direction = "vertical" })
        local go_back = true
        local width = vim.o.columns * 0.30

        terminal:toggle(width)
        terminal:send("clear;" .. cmd, go_back)

        vim.keymap.set("n", "<leader>tk", function()
          terminal:close()
        end, { desc = "Close test runner" })
      end,
    }
    vim.g["test#strategy"] = "toggleterm"
  end,
}
