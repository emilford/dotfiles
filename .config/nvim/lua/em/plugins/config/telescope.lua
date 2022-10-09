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
      preview = {
        hide_on_startup = true,
      },
    })
  end, { silent = true })

  vim.keymap.set("n", "<leader>fh", function()
    require("telescope.builtin").help_tags({
      layout_config = {
        preview_width = 0.55,
        prompt_position = "top",
      },
      sorting_strategy = "ascending",
    })
  end, { silent = true })
end

return M
