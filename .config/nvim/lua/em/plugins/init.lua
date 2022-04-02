local utils = require("em.utils.plugins")

return require("packer").startup(function()
  use({ "wbthomason/packer.nvim" })

  use({
    "AndrewRadev/splitjoin.vim",
    config = utils.config("splitjoin"),
  })
  use({
    "DarwinSenior/nvim-colorizer.lua",
    config = utils.config("nvim-colorizer"),
  })
  use({
    "RishabhRD/lspactions",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-lua/popup.nvim" },
      { "tjdevries/astronauta.nvim" },
    },
    branch = "nvim-0.6-compatible",
  })
  use({
    "SirVer/ultisnips",
    config = utils.config("ultisnips"),
  })
  use({
    "ThePrimeagen/harpoon",
    config = utils.config("harpoon"),
    keys = { "<leader>h", "<leader>a", "<leader>1", "<leader>2", "<leader>3", "<leader>4" },
  })
  use({
    "arcticicestudio/nord-vim",
    config = utils.config("nord-vim"),
  })
  use({ "b0o/schemastore.nvim" })
  use({ "christoomey/vim-sort-motion" })
  use({ "christoomey/vim-system-copy" })
  use({ "christoomey/vim-tmux-navigator" })
  use({
    "christoomey/vim-tmux-runner",
    config = utils.config("vim-tmux-runner"),
  })
  use({ "dhruvasagar/vim-zoom" })
  use({ "ervandew/supertab" })
  use({
    "folke/zen-mode.nvim",
    config = utils.config("zen-mode"),
  })
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-buffer" })
  use({ "hrsh7th/cmp-path" })
  use({ "hrsh7th/cmp-cmdline" })
  use({ "hrsh7th/nvim-cmp" })
  use({
    "janko-m/vim-test",
    config = utils.config("vim-test"),
  })
  use({ "jceb/vim-textobj-uri" })
  use({ "jiangmiao/auto-pairs" })
  use({ "jose-elias-alvarez/null-ls.nvim" })
  use({ "jose-elias-alvarez/nvim-lsp-ts-utils" })
  use({
    "junegunn/vim-easy-align",
    config = utils.config("vim-easy-align"),
  })
  use({ "kana/vim-textobj-entire" })
  use({ "kana/vim-textobj-indent" })
  use({ "kana/vim-textobj-line" })
  use({ "kana/vim-textobj-user" })
  use({ "keith/rspec.vim" })
  use({ "kristijanhusak/vim-dadbod-completion" })
  use({
    "lambdalisue/vim-gista",
    config = utils.config("vim-gista"),
  })
  use({
    "mtth/scratch.vim",
    config = utils.config("scratch"),
  })
  use({
    "mickael-menu/zk-nvim",
    config = utils.config("zk-nvim"),
  })
  use({
    "mrjones2014/dash.nvim",
    run = "make install",
  })
  use({ "neovim/nvim-lspconfig" })
  use({
    "numToStr/Comment.nvim",
    config = utils.config("comment"),
  })
  use({ "nvim-lua/plenary.nvim" })
  use({
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = utils.config("telescope"),
    module_pattern = "telescope.*",
    keys = { "<leader>ff" },
    requires = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
        after = "telescope.nvim",
      },
    },
  })
  use({
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufNewFile" },
    run = ":TSUpdate",
  })
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
  })
  use({ "onsails/lspkind-nvim" })
  use({ "pbrisbin/vim-mkdir" })
  use({ "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" })
  use({ "qalshidi/vim-bettergrep" })
  use({ "quangnguyen30192/cmp-nvim-ultisnips" })
  use({ "ray-x/lsp_signature.nvim" })
  use({ "ryvnf/readline.vim" })
  use({ "shumphrey/fugitive-gitlab.vim" })
  use({ "tommcdo/vim-exchange" })
  use({ "tpope/vim-abolish" })
  use({ "tpope/vim-bundler" })
  use({
    "tpope/vim-dadbod",
    config = utils.config("vim-dadbod"),
  })
  use({ "tpope/vim-endwise" })
  use({ "tpope/vim-eunuch" })
  use({
    "tpope/vim-fugitive",
    config = utils.config("vim-fugitive"),
  })
  use({ "tpope/vim-git" })
  use({ "tpope/vim-heroku" })
  use({ "tpope/vim-rails" })
  use({ "tpope/vim-rake" })
  use({ "tpope/vim-repeat" })
  use({ "tpope/vim-rhubarb" })
  use({ "tpope/vim-surround" })
  use({ "tpope/vim-unimpaired" })
  use({ "wellle/targets.vim" })
  use({ "williamboman/nvim-lsp-installer" })
  use({
    "wincent/loupe",
    config = utils.config("loupe"),
  })
end)
