local M = {}

function M.config()
  vim.api.nvim_set_keymap(
    "n",
    "<leader>h",
    "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
    { noremap = true }
  )
  vim.api.nvim_set_keymap("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", { noremap = true })
  vim.api.nvim_set_keymap("n", "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { noremap = true })
  vim.api.nvim_set_keymap("n", "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { noremap = true })
  vim.api.nvim_set_keymap("n", "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { noremap = true })
  vim.api.nvim_set_keymap("n", "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", { noremap = true })
end

return M
