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
      -- TODO: Move this to a custom extension
      "<leader>fn",
      function()
        require("telescope.builtin").find_files({
          prompt_title = "Project Notes",
          cwd = "./notes",
          hidden = true,
          layout_config = {
            height = 0.40,
            width = 0.40,
          },
          preview = {
            hide_on_startup = true,
          },
        })
      end,
    },
  },
  opts = function()
    return {
      defaults = {
        mappings = {
          i = {
            ["<c-\\>"] = require("telescope.actions.layout").toggle_preview,
          },
        },
      },
      pickers = {
        find_files = {
          layout_config = {
            preview_width = 0.55,
          },
          preview = {
            hide_on_startup = true,
          },
        },
        git_files = {
          layout_config = {
            preview_width = 0.55,
          },
          preview = {
            hide_on_startup = true,
          },
          show_untracked = true,
        },
        help_tags = {
          layout_config = {
            prompt_position = "top",
          },
          sorting_strategy = "ascending",
        },
      },
    }
  end,
  config = function(_, opts)
    local telescope = require("telescope")

    telescope.setup(opts)
    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
  end,
}
