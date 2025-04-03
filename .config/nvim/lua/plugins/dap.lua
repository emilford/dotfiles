return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "igorlfs/nvim-dap-view", opts = {} },
      { "suketa/nvim-dap-ruby", opts = {} },
      { "theHamsta/nvim-dap-virtual-text", opts = {} },
      { "nvim-neotest/nvim-nio" },
    },
    keys = {
      {
        "<leader>dB",
        function()
          require("dap").set_breakpoint(vim.fn.input("Condition: "))
        end,
        desc = "Add conditional breakpoint",
      },
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle breakpoint",
      },
      {
        "<leader>dc",
        function()
          vim.fn.setenv("RUBYOPT", "-rdebug/open")
          require("dap").continue()
        end,
        desc = "Resume or start debug session",
      },
      {
        "<leader>dC",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Continue execution to cursor",
      },
      {
        "<leader>dg",
        function()
          require("dap").goto_()
        end,
        desc = "Jump to current line",
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step into function or method",
      },
      {
        "<leader>dj",
        function()
          require("dap").down()
        end,
        desc = "Go down in stacktrace without stepping",
      },
      {
        "<leader>dk",
        function()
          require("dap").up()
        end,
        desc = "Go up in stacktrace without stepping",
      },
      {
        "<leader>dl",
        function()
          require("dap").run_last()
        end,
        desc = "Run session using last debug adapter",
      },
      {
        "<leader>dO",
        function()
          require("dap").step_out()
        end,
        desc = "Step out of function or method",
      },
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "Step over function or method",
      },
      {
        "<leader>dP",
        function()
          require("dap").pause()
        end,
        desc = "Pause debug session thread",
      },
      {
        "<leader>dt",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate debug session",
      },
      {
        "<leader>dx",
        function()
          require("dap").clear_breakpoints()
        end,
        desc = "Remove all breakpoints",
      },
    },
    config = function()
      local icons = require("config.icons").dap

      vim.fn.sign_define("DapStopped", { text = icons.Stopped, texthl = "DapStopped", linehl = "DapStoppedLine" })
      vim.fn.sign_define("DapBreakpoint", { text = icons.Breakpoint, texthl = "DapBreakpoint" })
      vim.fn.sign_define("DapBreakpointCondition", { text = icons.BreakpointCondition, texthl = "DapBreakpoint" })
      vim.fn.sign_define("DapBreakpointRejected", { text = icons.BreakpointRejected, texthl = "DapBreakpointRejected" })
      vim.fn.sign_define("DapLogPoint", { text = icons.LogPoint, texthl = "DapLogPoint" })

      local dap = require("dap")
      table.insert(dap.configurations.ruby, {
        type = "ruby",
        name = "debug test file",
        request = "attach",
        localfs = true,
        command = { "ruby", "bin/rails", "test" },
        script = { "${relativeFile}" },
      })
      table.insert(dap.configurations.ruby, {
        type = "ruby",
        name = "debug test nearest",
        request = "attach",
        localfs = true,
        command = { "ruby", "bin/rails", "test" },
        script = function()
          local line = vim.api.nvim_win_get_cursor(0)[1]

          return { "${relativeFile}:" .. line }
        end,
      })
      table.insert(dap.configurations.ruby, {
        type = "ruby",
        request = "launch",
        options = { source_filetype = "ruby" },
        error_on_failure = true,
        localfs = true,
        name = "run rails test current_file:current_line",
        command = "bundle",
        -- args = { "exec", "bin/rails", "test" },
        args = { "exec", "rdbg", "-c", "--nonstop", "--", "rails", "test" },
        current_line = true,
        waiting = 1000,
        random_port = true,
      })

      table.insert(dap.configurations.ruby, {
        name = "run test current_file:current_line",
        command = "bundle",
        args = { "exec", "rails", "test" },
        current_line = true,
        waiting = 1000,
        random_port = true,
        type = "ruby",
        request = "attach",
        options = { source_filetype = "ruby" },
        error_on_failure = true,
        localfs = true,
      })
      -- extend_run_config({ name = "run rspec current_file:current_line", command = "bundle", args = { "exec", "rspec" }, current_line = true })
    end,
  },
  {
    "igorlfs/nvim-dap-view",
    keys = {
      {
        "<leader>dv",
        function()
          require("dap-view").toggle()
        end,
        desc = "Toggle debug UI",
      },
      {
        "<leader>dw",
        function()
          require("dap-view").add_expr()
        end,
        desc = "Add variable under cursor to watch list",
      },
    },
    opts = {
      windows = {
        terminal = {
          hide = { "ruby" },
        },
      },
    },
  },
}
