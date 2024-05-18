return {
  "petertriho/cmp-git",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    github = {
      pull_requests = {
        state = "all",
      },
    },
  },
}
