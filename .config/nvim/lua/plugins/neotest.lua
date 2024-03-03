return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "olimorris/neotest-rspec",
  },
  keys = {
    {
      "<leader>ta",
      function()
        require("neotest.lib").notify("󰕇 Running test suite", vim.log.levels.INFO)
        require("neotest").run.run({ suite = true })
      end,
      desc = "Run all",
    },
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
      consumers = {
        notify = function(client)
          client.listeners.results = function(_, results, partial)
            if partial then
              return
            end

            local counts = {}
            for _, result in pairs(results) do
              if result.short then
                counts[result.status] = counts[result.status] and counts[result.status] + 1 or 1
              end
            end

            local level = vim.log.levels.INFO

            if counts.skipped then
              level = vim.log.levels.WARN
            end

            if counts.failed then
              level = vim.log.levels.ERROR
            end

            local stats = {}
            for status, count in pairs(counts) do
              table.insert(stats, string.format("%s: %s", status:gsub("^%l", string.upper), count))
            end

            local message = "Tests completed. " .. table.concat(stats, ", ")
            require("neotest.lib").notify(message, level)
          end

          return {}
        end,
      },
    }
  end,
}
