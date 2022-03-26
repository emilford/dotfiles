local M = {}

function M.config()
  vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", os.getenv("HOME") .. "/.config/coc/ultisnips" }
end

return M
