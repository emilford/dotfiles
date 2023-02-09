return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "RRethy/nvim-treesitter-endwise",
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      init = function()
        -- no need to load the plugin, since we only need its queries
        require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
      end,
    },
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
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
    require("nvim-ts-autotag").setup()
  end,
}
