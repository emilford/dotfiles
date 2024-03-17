return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },
  },
  keys = {
    {
      "<leader>fb",
      "<cmd>Telescope git_branches<cr>",
      desc = "Find branch (Git)",
    },
    {
      "<leader>ff",
      "<cmd>Telescope git_files<cr>",
      desc = "Find files (Git)",
    },
    {
      "<leader>fF",
      "<cmd>Telescope find_files<cr>",
      desc = "Find files",
    },
    {
      "<leader>fh",
      "<cmd>Telescope help_tags<cr>",
      desc = "Find help",
    },
    {
      "<leader>fn",
      "<cmd>Telescope find_files cwd=./notes hidden=true<cr>",
      desc = "Find notes",
    },
    {
      "<leader>f/",
      "<cmd>Telescope current_buffer_fuzzy_find<cr>",
      desc = "Find buffer",
    },
  },
  opts = {
    pickers = {
      current_buffer_fuzzy_find = {
        previewer = false,
        prompt_title = false,
        theme = "dropdown",
      },
      find_files = {
        previewer = false,
        prompt_title = false,
        theme = "dropdown",
      },
      git_branches = {
        previewer = false,
        prompt_title = false,
        theme = "dropdown",
      },
      git_files = {
        previewer = false,
        prompt_title = false,
        show_untracked = true,
        theme = "dropdown",
      },
      help_tags = {
        results_title = false,
        prompt_title = false,
        preview_title = false,
        layout_config = {
          preview_width = 0.55,
        },
      },
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")

    telescope.setup(opts)
    telescope.load_extension("fzf")
  end,
}
