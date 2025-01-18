return {
  "echasnovski/mini.pick",
  version = false,
  dependencies = {
    "echasnovski/mini.extra",
  },
  cmd = {
    "Pick",
  },
  keys = {
    {
      "<leader>fb",
      function()
        require("mini.extra").pickers.git_branches()
      end,
      desc = "Find branch (Git)",
    },
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
      desc = "Find files",
    },
    {
      "<leader>fh",
      function()
        require("mini.pick").builtin.help()
      end,
      desc = "Find help",
    },
    {
      "<leader>fn",
      function()
        require("mini.pick").builtin.files(nil, { source = { cwd = "./notes" } })
      end,
      desc = "Find notes",
    },
    {
      "<leader>f/",
      function()
        require("mini.pick").builtin.grep_live()
      end,
      desc = "Find buffer",
    },
  },
  opts = {},
}
