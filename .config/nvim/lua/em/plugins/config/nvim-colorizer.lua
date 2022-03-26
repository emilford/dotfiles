local M = {}

function M.config()
  require("colorizer").setup(nil, {
    mode = "virtualtext",
  })
end

return M
