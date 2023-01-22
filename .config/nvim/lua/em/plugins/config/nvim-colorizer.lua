return {
  "DarwinSenior/nvim-colorizer.lua",
  event = "BufReadPre",
  config = function()
    require("colorizer").setup(nil, {
      mode = "virtualtext",
    })
  end,
}
