local M = {}

--- Given a path, return a shortened version of it.
---
--- @param path string a relative path
--- @param opts table
--- @return string
---
--- opts.short_len: int - the number of chars to shorten each head component to (default: 1)
--- opts.tail_count: int - the number of tail components to keep unshortened (default: 2)
--- opts.head_max: int - the max number of components to keep, including the tail
---     components. If 0, keep all components. Excess components are
---     trimmed starting from the head. (default: 0)
---
M.shorten_path = function(path, opts)
  local Path = require("plenary.path")

  path = vim.fn.fnamemodify(path, ":.")
  opts = vim.tbl_extend("keep", opts, { short_len = 1, tail_count = 2, head_max = 0 })

  local components = vim.split(path, Path.path.sep)

  if #components == 1 or #components == opts.tail_count then
    return path
  end

  local tail = { unpack(components, #components - opts.tail_count + 1) }
  local head = { unpack(components, 1, #components - opts.tail_count) }

  if opts.head_max > 0 and #head > opts.head_max then
    head = { unpack(head, #head - opts.head_max + 1) }
  end

  return table.concat({
    #head > 0 and Path.new(unpack(head)):shorten(opts.short_len, {}) or nil,
    table.concat(tail, Path.path.sep),
  }, Path.path.sep)
end

return M
