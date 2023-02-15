return {
  "SirVer/ultisnips",
  init = function()
    vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", os.getenv("HOME") .. "/.config/coc/ultisnips" }
  end,
}
