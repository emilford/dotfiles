return {
  {
    "cbochs/grapple.nvim",
    keys = {
      { "<leader>a", "<cmd>Grapple tag<cr>", desc = "Add file to tag list" },
      { "<leader>h", "<cmd>Grapple toggle_tags<cr>", desc = "Show tag list" },
      { "<leader>1", "<cmd>Grapple select index=1<cr>", desc = "Open tagged file 1" },
      { "<leader>2", "<cmd>Grapple select index=2<cr>", desc = "Open tagged file 2" },
      { "<leader>3", "<cmd>Grapple select index=3<cr>", desc = "Open tagged file 3" },
      { "<leader>4", "<cmd>Grapple select index=4<cr>", desc = "Open tagged file 4" },
      { "<leader>5", "<cmd>Grapple select index=5<cr>", desc = "Open tagged file 5" },
      { "<c-m-n>", "<cmd>Grapple cycle_tags next<cr>", desc = "Go to next tag" },
      { "<c-m-p>", "<cmd>Grapple cycle_tags prev<cr>", desc = "Go to previous tag" },
    },
    opts = {
      icons = false,
      status = false,
    },
  },
}
