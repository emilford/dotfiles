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
        local width = vim.o.columns * 0.30

        require("toggleterm").exec_command("cmd='clear;" .. cmd .. "' size=" .. width .. " direction='vertical'", 999)

        vim.keymap.set("n", "<leader>tk", function()
          vim.cmd("999ToggleTerm")
        end, { desc = "Close test runner" })
      end,
    }
    vim.g["test#strategy"] = "toggleterm"
  end,
}
