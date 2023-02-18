return {
  "lambdalisue/vim-gista",
  cmd = "Gista",
  config = function()
    vim.g["gista#command#post#default_public"] = 0
  end,
}
