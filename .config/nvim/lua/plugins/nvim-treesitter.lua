return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "RRethy/nvim-treesitter-endwise",
    "windwp/nvim-ts-autotag",
  },
  opts = {
    endwise = {
      enable = true,
    },
    ensure_installed = {
      "bash",
      "comment",
      "css",
      "dockerfile",
      "eex",
      "elixir",
      "embedded_template",
      "fish",
      "graphql",
      "help",
      "html",
      "http",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "make",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "ruby",
      "scss",
      "terraform",
      "todotxt",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vue",
      "yaml",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
      disable = { "ruby" },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
    require("nvim-ts-autotag").setup()

    vim.treesitter.language.register("ruby", "ruby.rspec")
  end,
}
