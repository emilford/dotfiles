local M = {}

function M.config()
  require("telescope").setup({
    defaults = {
      mappings = {
        i = {
          ["<c-\\>"] = require("telescope.actions.layout").toggle_preview,
        },
      },
      preview = {
        hide_on_startup = true,
      },
    },
  })

  vim.keymap.set(
    "n",
    "<leader>ff",
    [[<cmd> lua require("telescope.builtin").git_files()<cr>]],
    { silent = true }
  )
end

return M
