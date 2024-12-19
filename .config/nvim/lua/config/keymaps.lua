local map = function(mode, lhs, rhs, opts)
  opts = vim.tbl_deep_extend("force", { silent = true }, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Toggle option
map("n", [[\C]], "<cmd>setlocal cursorcolumn!<cr>", { desc = "Toggle 'cursorcolumn'" })
map("n", [[\c]], "<cmd>setlocal cursorline!<cr>", { desc = "Toggle 'cursorline'" })
map("n", [[\i]], "<cmd>setlocal ignorecase!<cr>", { desc = "Toggle 'ignorecase'" })
map("n", [[\l]], "<cmd>setlocal list!<cr>", { desc = "Toggle 'list'" })
map("n", [[\n]], "<cmd>setlocal number!<cr>", { desc = "Toggle 'number'" })
map("n", [[\r]], "<cmd>setlocal relativenumber!<cr>", { desc = "Toggle 'relativenumber'" })
map("n", [[\s]], "<cmd>setlocal spell!<cr>", { desc = "Toggle 'spell'" })
map("n", [[\w]], "<cmd>setlocal wrap!<cr>", { desc = "Toggle 'wrap'" })
