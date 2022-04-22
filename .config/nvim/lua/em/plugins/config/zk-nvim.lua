local M = {}

function M.config()
  require("zk").setup({
    picker = "telescope",
  })

  -- Add the key mappings only when in a zk notebook
  if require("zk.util").notebook_root(vim.fn.getcwd()) ~= nil then
    vim.keymap.set("n", "<cr>", "<cmd>lua vim.lsp.buf.definition()<cr>", { silent = true })
    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { silent = true })
    vim.keymap.set("n", "<leader>zb", "<cmd>ZkBacklinks<cr>", { silent = true })
    vim.keymap.set("n", "<leader>zf", "<cmd>ZkNotes<cr>", { silent = true })
    vim.keymap.set(
      "n",
      "<leader>zF",
      "<cmd>ZkNotes { dir = vim.fn.expand('%:p:h'), match = vim.fn.input('Search: ') }<cr>",
      { silent = true }
    )
    vim.keymap.set("v", "<leader>zf", ":'<'>ZkMatch<cr>", { silent = true })
    vim.keymap.set("n", "<leader>zi", "<cmd>ZkIndex<cr>", { silent = true })
    vim.keymap.set("n", "<leader>zl", "<cmd>ZkLinks<cr>", { silent = true })
    vim.keymap.set(
      "n",
      "<leader>zn",
      "<cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<cr>",
      { silent = true }
    )
    vim.keymap.set(
      "v",
      "<leader>zn",
      ":'<'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<cr>",
      { silent = true }
    )
    vim.keymap.set(
      "v",
      "<leader>zN",
      ":'<'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') } <cr>",
      { silent = true }
    )
    vim.keymap.set("n", "<leader>zt", "<cmd>ZkTags<cr>", { silent = true })
  end
end

return M
