return {
  "mfussenegger/nvim-dap",
  dependencies = {
    { "rcarriga/nvim-dap-ui" },
    { "suketa/nvim-dap-ruby" },
    { "theHamsta/nvim-dap-virtual-text", opts = true },
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
        require("dap").continue()
      end,
      desc = "Continue debug session",
    },
    {
      "<leader>dC",
      function()
        require("dap").run_to_cursor()
      end,
      desc = "Continue to new breakpoint",
    },
    {
      "<leader>di",
      function()
        require("dap").step_into()
      end,
      desc = "Step Into",
    },
    {
      "<leader>dj",
      function()
        require("dap").down()
      end,
      desc = "Go down the stack frame",
    },
    {
      "<leader>dk",
      function()
        require("dap").up()
      end,
      desc = "Go up the stack frame",
    },
    {
      "<leader>dl",
      function()
        require("dap").run_last()
      end,
      desc = "Run last debug session",
    },
    {
      "<leader>do",
      function()
        require("dap").step_over()
      end,
      desc = "Step Over",
    },
    {
      "<leader>dp",
      function()
        require("dap").pause()
      end,
      desc = "Pause debug session",
    },
    {
      "<leader>dr",
      function()
        require("dapui").float_element("repl", {
          width = 100,
          height = 20,
          enter = true,
          position = "center",
        })
      end,
      desc = "Launch REPL",
    },
    {
      "<leader>dt",
      function()
        require("dap").terminate()
      end,
      desc = "End debug session",
    },
    {
      "<leader>dx",
      function()
        require("dap").clear_breakpoints()
      end,
      desc = "Clear breakpoints",
    },
  },
  init = function()
    local icons = require("config").icons.dap

    for name, sign in pairs(icons) do
      sign = type(sign) == "table" and sign or { sign }
      vim.fn.sign_define(
        "Dap" .. name,
        { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
      )
    end
  end,
  config = function()
    require("dap-ruby").setup()

    dap = require("dap")
    dap.configurations.ruby = {
      {
        type = "ruby",
        name = "Debug current file",
        bundle = "",
        request = "attach",
        command = "ruby",
        script = "${file}",
        port = 38698,
        server = "127.0.0.1",
        options = {
          source_filetype = "ruby",
        },
        localfs = true,
        waiting = 1000,
      },
      {
        type = "ruby",
        name = "Debug server",
        bundle = "bundle",
        request = "attach",
        command = "rails",
        script = "s",
        port = 38698,
        server = "127.0.0.1",
        options = {
          source_filetype = "ruby",
        },
        localfs = true,
        waiting = 1000,
      },
    }

    dap.configurations["ruby.rspec"] = {
      {
        type = "ruby",
        name = "RSpec: Run current line",
        bundle = "bundle",
        request = "attach",
        command = "rspec",
        script = "${file}",
        port = 38698,
        server = "127.0.0.1",
        options = {
          source_filetype = "ruby",
        },
        localfs = true,
        waiting = 1000,
        current_line = true,
      },
    }
  end,
}
