return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "olimorris/neotest-rspec",
  },
  keys = {
    { "<leader>ta", '<cmd>lua require("neotest").run.run({suite = true})<CR>', desc = "Run all" },
    { "<leader>tf", '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', desc = "Run file" },
    { "<leader>tn", '<cmd>lua require("neotest").run.run()<CR>', desc = "Run nearest" },
    { "<leader>tl", '<cmd>lua require("neotest").run.run_last()<CR>', desc = "Run last" },

    { "<leader>tm", '<cmd>lua require("neotest").summary.run_marked()<CR>', desc = "Run marked" },
    {
      "<leader>to",
      '<cmd>lua require("neotest").output.open({short = true, enter = true})<CR>',
      desc = "Show short output",
    },
    { "<leader>tO", '<cmd>lua require("neotest").output.open({enter = true})<CR>', desc = "Show full output" },
    { "<leader>ts", '<cmd>lua require("neotest").summary.toggle()<CR>', desc = "Toggle summary window" },
  },
  opts = function()
    return {
      icons = {
        running = "󰕇",
        passed = "",
      },
      diagnostic = {
        enabled = false,
      },
      status = {
        signs = false,
        virtual_text = true,
      },
      adapters = {
        require("neotest-rspec")({
          filter_dirs = { ".git", ".node_modules", "vendor" },
        }),
      },
    }
  end,
}
