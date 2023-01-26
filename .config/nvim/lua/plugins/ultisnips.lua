return {
  "SirVer/ultisnips",
  config = function()
    vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", os.getenv("HOME") .. "/.config/coc/ultisnips" }
  end,
}
