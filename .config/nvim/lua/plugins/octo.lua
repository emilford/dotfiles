return {
  "pwntester/octo.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    enable_builtin = true,
    -- mappings_disable_default = true,
  },
  keys = {
    { "<leader>o", "<cmd>Octo<cr>", desc = "Octo" },
  },
  init = function()
    -- vim.cmd([[hi OctoEditable guibg=none]])
  end,
}
