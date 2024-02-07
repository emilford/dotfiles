return {
  "knubie/vim-kitty-navigator",
  event = { "BufReadPre", "BufNewFile" },
  build = "cp ./*.py ~/.config/kitty/",
}
