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

-- Override the default <C-]> mapping to itself so that it isn't remaped in ruby ftplugin
-- This is done to improve the jump to definition comand when using ruby-lsp
-- https://github.com/neovim/neovim/issues/30160
map("n", "<C-]>", "<C-]>", { noremap = true })

-- Yank file path/name
local function copy_buffer_name_to_clipboard(mods)
  local result = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), mods)
  vim.fn.setreg("+", result)
  vim.notify("Copied: " .. result)
end

map("n", "cpr", function()
  copy_buffer_name_to_clipboard(":.")
end, { desc = "Copy relative file path" })

map("n", "cpa", function()
  copy_buffer_name_to_clipboard(":p")
end, { desc = "Copy absolute file path" })

map("n", "cpd", function()
  copy_buffer_name_to_clipboard(":p:h")
end, { desc = "Copy directory" })

map("n", "cpf", function()
  copy_buffer_name_to_clipboard(":t")
end, { desc = "Copy filename" })
