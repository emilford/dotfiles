return {
  "mickael-menu/zk-nvim",
  opts = {
    picker = "telescope",
  },
  lazy = false,
  cond = function()
    return vim.fn.isdirectory(".zk") ~= 0
  end,
  config = function(_, opts)
    require("zk").setup(opts)

    vim.keymap.set("n", "<cr>", "<cmd>lua vim.lsp.buf.definition()<cr>", { buffer = 0 })
    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { buffer = 0 })

    local wk = require("which-key")
    wk.register({
      z = {
        name = "+ZettelKasten",
        b = { "<cmd>ZkBacklinks<cr>", "Backlinks" },
        o = { "<cmd>ZkNotes<cr>", "Open" },
        f = { "<cmd>ZkNotes { dir = vim.fn.expand('%:p:h'), match = vim.fn.input('Find: ') }<cr>", "Find" },
        i = { "<cmd>ZkIndex<cr>", "Index" },
        l = { "<cmd>ZkLinks<cr>", "Links" },
        n = { "<cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<cr>", "New" },
        t = { "<cmd>ZkTags<cr>", "Tags" },
      },
    }, { prefix = "<leader>", mode = "n" })

    wk.register({
      z = {
        name = "+ZettelKasten",
        f = { ":'<'>ZkMatch<cr>", "Find" },
        n = { ":'<'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<cr>", "New" },
        N = {
          ":'<'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') } <cr>",
          "New",
        },
      },
    }, { prefix = "<leader>", mode = "v" })
  end,
}
