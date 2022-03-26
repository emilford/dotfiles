local M = {}

function M.config()
  require("zk").setup({
    picker = "telescope",
  })

  -- Add the key mappings only when in a zk notebook
  if require("zk.util").notebook_root(vim.fn.getcwd()) ~= nil then
    vim.api.nvim_set_keymap("n", "<cr>", "<cmd>lua vim.lsp.buf.definition()<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>zb", "<cmd>ZkBacklinks<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>zf", "<cmd>ZkNotes<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap(
      "n",
      "<leader>zF",
      "<cmd>ZkNotes { dir = vim.fn.expand('%:p:h'), match = vim.fn.input('Search: ') }<cr>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap("v", "<leader>zf", ":'<'>ZkMatch<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>zi", "<cmd>ZkIndex<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>zl", "<cmd>ZkLinks<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap(
      "n",
      "<leader>zn",
      "<cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<cr>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      "v",
      "<leader>zn",
      ":'<'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<cr>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      "v",
      "<leader>zN",
      ":'<'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') } <cr>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap("n", "<leader>zt", "<cmd>ZkTags<cr>", { noremap = true, silent = true })
  end
end

return M
