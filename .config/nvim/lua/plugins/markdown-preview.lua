return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  cmd = {
    "MarkdownPreviewToggle",
    "MarkdownPreview",
    "MarkdownPreviewStop",
  },
  keys = {
    { "<leader>m", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle markdown preview" },
  },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
}
