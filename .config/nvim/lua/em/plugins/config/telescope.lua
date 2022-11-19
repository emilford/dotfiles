local M = {}

function M.config()
  require("telescope").setup({
    defaults = {
      mappings = {
        i = {
          ["<c-\\>"] = require("telescope.actions.layout").toggle_preview,
        },
      },
    },
  })

  vim.keymap.set("n", "<leader>ff", function()
    require("telescope.builtin").git_files({
      layout_config = {
        preview_width = 0.55,
      },
      preview = {
        hide_on_startup = true,
      },
    })
  end, { silent = true })

  vim.keymap.set("n", "<leader>fh", function()
    require("telescope.builtin").help_tags({
      layout_config = {
        prompt_position = "top",
      },
      sorting_strategy = "ascending",
    })
  end, { silent = true })

  vim.keymap.set("n", "<leader>fn", function()
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
  end, { silent = true })
end

return M
