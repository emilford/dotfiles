local utils = require("em.utils")

return require("packer").startup({
  function()
    use({ "wbthomason/packer.nvim" })

    use({
      "AndrewRadev/splitjoin.vim",
      config = utils.config("splitjoin"),
      keys = { "gS", "gJ" },
    })
    use({
      "DarwinSenior/nvim-colorizer.lua",
      config = utils.config("nvim-colorizer"),
    })
    use({
      "RRethy/nvim-treesitter-endwise",
      after = "nvim-treesitter",
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
      "rose-pine/neovim",
      as = "rose-pine",
      config = utils.config("rose-pine"),
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
    use({ "fladson/vim-kitty" })
    use({
      "folke/which-key.nvim",
      config = utils.config("which-key"),
    })
    use({
      "folke/zen-mode.nvim",
      config = utils.config("zen-mode"),
    })
    use({
      "glepnir/lspsaga.nvim",
      branch = "main",
      config = utils.config("lspsaga"),
    })
    use({ "hrsh7th/cmp-nvim-lsp" })
    use({ "hrsh7th/cmp-buffer" })
    use({ "hrsh7th/cmp-path" })
    use({ "hrsh7th/cmp-cmdline" })
    use({ "hrsh7th/cmp-nvim-lua" })
    use({
      "hrsh7th/nvim-cmp",
      config = utils.config("cmp"),
    })
    use({
      "janko-m/vim-test",
      config = utils.config("vim-test"),
    })
    use({
      "j-hui/fidget.nvim",
      config = utils.config("fidget"),
    })
    use({ "jceb/vim-textobj-uri" })
    use({
      "jose-elias-alvarez/null-ls.nvim",
      config = utils.config("null-ls"),
    })
    use({ "jose-elias-alvarez/typescript.nvim" })
    use({
      "junegunn/vim-easy-align",
      config = utils.config("vim-easy-align"),
    })
    use({ "kana/vim-textobj-entire" })
    use({ "kana/vim-textobj-indent" })
    use({ "kana/vim-textobj-line" })
    use({ "kana/vim-textobj-user" })
    use({ "keith/rspec.vim" })
    use({ "khaveesh/vim-fish-syntax" })
    use({ "kristijanhusak/vim-dadbod-completion" })
    use({
      "lambdalisue/vim-gista",
      config = utils.config("vim-gista"),
    })
    use({
      "ldelossa/gh.nvim",
      config = utils.config("gh"),
      requires = { { "ldelossa/litee.nvim" } },
    })
    use({
      "lukas-reineke/indent-blankline.nvim",
      config = utils.config("indent-blankline"),
    })
    use({
      "mickael-menu/zk-nvim",
      config = utils.config("zk-nvim"),
    })
    use({
      "mrjones2014/dash.nvim",
      run = "make install",
    })
    use({
      "neovim/nvim-lspconfig",
      config = utils.config("lspconfig"),
    })
    use({
      "numToStr/Comment.nvim",
      config = utils.config("comment"),
      keys = { "gc", "gb" },
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
          after = "telescope.nvim",
          config = utils.config("telescope-fzf-native"),
          run = "make",
        },
        {
          "nvim-telescope/telescope-ui-select.nvim",
          after = "telescope.nvim",
          config = utils.config("telescope-ui-select"),
        },
      },
    })
    use({
      "nvim-treesitter/nvim-treesitter",
      config = utils.config("nvim-treesitter"),
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
    use({
      "psliwka/vim-dirtytalk",
      config = utils.config("vim-dirtytalk"),
      ft = { "gitcommit", "markdown" },
      run = ":DirtytalkUpdate",
    })
    use({ "qalshidi/vim-bettergrep" })
    use({ "quangnguyen30192/cmp-nvim-ultisnips" })
    use({ "ray-x/lsp_signature.nvim" })
    use({
      "ryvnf/readline.vim",
      config = utils.config("readline"),
    })
    use({ "shumphrey/fugitive-gitlab.vim" })
    use({ "tommcdo/vim-exchange" })
    use({ "tpope/vim-abolish" })
    use({ "tpope/vim-bundler" })
    use({
      "tpope/vim-dadbod",
      config = utils.config("vim-dadbod"),
    })
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
    use({ "tpope/vim-sleuth" })
    use({ "tpope/vim-surround" })
    use({ "tpope/vim-unimpaired" })
    use({ "tpope/vim-vinegar" })
    use({ "wellle/targets.vim" })
    use({
      "wincent/loupe",
      config = utils.config("loupe"),
    })
    use({
      "windwp/nvim-autopairs",
      config = utils.config("nvim-autopairs"),
    })
    use({
      "windwp/nvim-ts-autotag",
      after = "nvim-treesitter",
      config = utils.config("nvim-ts-autotag"),
    })
  end,
  config = {
    max_jobs = 50,
  },
})
