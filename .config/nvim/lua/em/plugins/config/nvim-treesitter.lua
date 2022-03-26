local M = {}

function M.config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = "maintained",
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
        },
      },
    },
  })
end

return M
