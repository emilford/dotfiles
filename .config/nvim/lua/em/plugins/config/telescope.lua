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

  vim.api.nvim_set_keymap(
    "n",
    "<leader>ff",
    [[<cmd> lua require("telescope.builtin").git_files()<cr>]],
    { noremap = true, silent = true }
  )
end

return M
