return {
  "DarwinSenior/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("colorizer").setup(nil, {
      mode = "virtualtext",
    })
  end,
}
