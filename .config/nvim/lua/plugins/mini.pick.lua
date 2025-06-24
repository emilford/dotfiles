return {
  {
    "echasnovski/mini.pick",
    version = false,
    cmd = {
      "Pick",
    },
    keys = {
      {
        "<leader>ff",
        function()
          require("mini.pick").builtin.files({ tool = "git" })
        end,
        desc = "Find files (Git)",
      },
      {
        "<leader>fF",
        function()
          require("mini.pick").builtin.files()
        end,
        desc = "Find files (All)",
      },
      {
        "<leader>fh",
        function()
          require("mini.pick").builtin.help()
        end,
        desc = "Find in help",
      },
      {
        "<leader>fn",
        function()
          require("mini.pick").builtin.files(nil, { source = { cwd = "./notes" } })
        end,
        desc = "Find in notes",
      },
      {
        "<leader>f/",
        function()
          require("mini.pick").builtin.grep_live()
        end,
        desc = "Find in buffer",
      },
    },
    init = function()
      vim.ui.select = function(...)
        return require("mini.pick").ui_select(...)
      end
    end,
  },
}
