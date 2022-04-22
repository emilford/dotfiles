local M = {}

function M.config()
  vim.g.scratch_height = 20
  vim.g.scratch_insert_autohide = 0
  vim.g.scratch_no_mappings = 1
  vim.g.scratch_persistence_file = "project-notes.txt"

  -- Pneumonic: go to notes
  vim.keymap.set("n", "gN", "<plug>(scratch-insert-clear)")
  vim.keymap.set("n", "gn", "<plug>(scratch-insert-reuse)")
  vim.keymap.set("x", "gN", "<plug>(scratch-selection-clear)")
  vim.keymap.set("x", "gn", "<plug>(scratch-selection-reuse)")
end

return M
