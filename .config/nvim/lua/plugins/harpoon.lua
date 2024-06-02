return {
  "ThePrimeagen/harpoon",
  keys = {
    { "<leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show Harpoon List" },
    { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add File to Harpoon List" },
    { "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Open Harpoon File 1" },
    { "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Open Harpoon File 2" },
    { "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Open Harpoon File 3" },
    { "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Open Harpoon File 4" },
  },
}
