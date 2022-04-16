local M = {}

---Require a plugin config
---@param name string
---@return any
function M.config(name)
  return require(string.format("em.plugins.config.%s", name)).config
end

return M
