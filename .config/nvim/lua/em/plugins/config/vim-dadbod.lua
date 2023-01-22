return {
  "tpope/vim-dadbod",
  config = function()
    -- TODO: Investigate using expr in `keys`
    vim.keymap.set("n", "<C-Q>", "db#op_exec()", { expr = true })
    vim.keymap.set("n", "<C-Q>", "db#op_exec()", { expr = true })
    vim.keymap.set("x", "<C-Q>", "db#op_exec()", { expr = true })
  end,
}
