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

end

return M
