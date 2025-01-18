return {
  "chrisgrieser/nvim-scissors",
  dependencies = "nvim-telescope/telescope.nvim",
  cmd = { "ScissorsAddNewSnippet", "ScissorsEditSnippet" },
  keys = {
    { "<leader>sa", "<cmd>ScissorsAddNewSnippet<cr>", desc = "Add New Snippet", mode = { "n", "x" } },
    { "<leader>se", "<cmd>ScissorsEditSnippet<cr>", desc = "Edit Existing Snippet" },
  },
  opts = {
    jsonFormatter = "jq",
  },
}
