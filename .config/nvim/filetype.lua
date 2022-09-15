-- Enabling filetype.lua is the default in 0.8. So for that
-- version we can remove these lines, but I don't see a way
-- to check for versions >= to, and has("nvim-0.7") is true
-- for 0.8 as well.
if vim.fn.has("nvim-0.8") == 1 then
else
  vim.g.do_filetype_lua = 1
  vim.g.did_load_filetypes = 0
end
