return {
  {
    "tpope/vim-dadbod",
    dependencies = {
      "tpope/vim-rails",
    },
    cmd = "DB",
    keys = {
      { "<c-q>", "db#op_exec()", expr = true, mode = { "n", "x" } },
    },
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    cmd = "DBUI",
    dependencies = {
      "kristijanhusak/vim-dadbod-completion",
      "tpope/vim-dadbod",
    },
    init = function()
      vim.g.db_ui_execute_on_save = 0
      vim.g.db_ui_save_location = ".db_ui"
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_use_nvim_notify = 1
    end,
  },
}
