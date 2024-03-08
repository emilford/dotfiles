return {
  "rcarriga/nvim-dap-ui",
  keys = {
    {
      "<leader>du",
      function()
        require("dapui").toggle({})
      end,
      desc = "Toggle UI",
    },
    {
      "<leader>de",
      function()
        require("dapui").eval()
      end,
      desc = "Evaluate expression",
      mode = { "n", "v" },
    },
  },
  opts = {
    layouts = {
      {
        elements = {
          {
            id = "stacks",
            size = 0.40,
          },
          {
            id = "breakpoints",
            size = 0.27,
          },
          {
            id = "watches",
            size = 0.33,
          },
        },
        size = 0.30,
        position = "left",
      },
      {
        elements = {
          {
            id = "repl",
            size = 1,
          },
        },
        size = 0.30,
        position = "bottom",
      },
    },
  },
  config = function(_plugin, opts)
    local dap, dapui = require("dap"), require("dapui")

    dapui.setup(opts)

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}
