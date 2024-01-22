return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },
  },
  keys = {
    {
      "<leader>ff",
      "<cmd>Telescope git_files<cr>",
    },
    {
      "<leader>fF",
      "<cmd>Telescope find_files<cr>",
    },
    {
      "<leader>fh",
      "<cmd>Telescope help_tags<cr>",
    },
    {
      "<leader>fn",
      "<cmd>Telescope find_files cwd=./notes hidden=true<cr>",
    },
  },
  opts = {
    pickers = {
      find_files = {
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
