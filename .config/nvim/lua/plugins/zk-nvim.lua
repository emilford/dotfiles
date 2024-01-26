return {
  "mickael-menu/zk-nvim",
  opts = {
    picker = "telescope",
  },
  lazy = false,
  main = "zk",
  cond = function()
    return vim.fn.isdirectory(".zk") ~= 0
  end,
  keys = {
    { "<leader>zb", "<cmd>ZkBacklinks<cr>", desc = "Show backlinks" },
    { "<leader>zl", "<cmd>ZkLinks<cr>", desc = "Show links" },
    {
      "<leader>zn",
      "<cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<cr>",
      desc = "Create new note",
    },
    { "<leader>zo", "<cmd>ZkNotes<cr>", desc = "Open note" },
    {
      "<leader>zs",
      "<cmd>ZkNotes { dir = vim.fn.expand('%:p:h'), match = vim.fn.input('Search: ') }<cr>",
      desc = "Search notes",
    },
    { "<leader>zt", "<cmd>ZkTags<cr>", desc = "Filter notes by tag" },

    { "<leader>zf", ":'<'>ZkMatch<cr>", mode = "v", desc = "Find notes matching selection" },
    {
      "<leader>znc",
      ":'<'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<cr>",
      mode = "v",
      desc = "Create note with content from selection",
    },
    {
      "<leader>znt",
      ":'<'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<cr>",
      mode = "v",
      desc = "Create note with title from selection",
    },
  },
}
