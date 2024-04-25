return {
  "knubie/vim-kitty-navigator",
  cond = function()
    return os.getenv("TERM") == "xterm-kitty"
  end,
  event = { "BufReadPre", "BufNewFile" },
  build = "cp ./*.py ~/.config/kitty/",
}
