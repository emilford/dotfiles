-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- use 'arcticicestudio/nord-vim'

  use 'hrsh7th/nvim-compe'

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'neovim/nvim-lspconfig'

  -- use 'shaunsingh/nord.nvim'
  use {
    'kunzaatko/nord.nvim',
    requires = {'rktjmp/lush.nvim', opt = true},
    -- config = function()
    --   vim.cmd("colorscheme nord")
    -- end,
    -- after = {'lush.nvim'},
    -- cond = 'false',
  } -- colorscheme

  use 'AndrewRadev/splitjoin.vim'
  use 'christoomey/vim-sort-motion'
  use 'christoomey/vim-system-copy'
  use 'christoomey/vim-tmux-navigator'
  use 'christoomey/vim-tmux-runner'
  use 'coderifous/textobj-word-column.vim'
  use 'dhruvasagar/vim-zoom'
  use 'ervandew/supertab'
  use 'glepnir/lspsaga.nvim'
  use 'janko-m/vim-test'
  use 'jceb/vim-textobj-uri'
  use 'jiangmiao/auto-pairs'
  use 'junegunn/vim-easy-align'
  use 'kana/vim-textobj-entire'
  use 'kana/vim-textobj-indent'
  use 'kana/vim-textobj-line'
  use 'kana/vim-textobj-user'
  use 'lambdalisue/vim-gista'
  use 'mtth/scratch.vim'
  use 'nelstrom/vim-textobj-rubyblock'
  use 'pbrisbin/vim-mkdir'
  use 'qalshidi/vim-bettergrep'
  use 'ryvnf/readline.vim'
  use 'sheerun/vim-polyglot'
  use 'shumphrey/fugitive-gitlab.vim'
  use 'tommcdo/vim-exchange'
  use 'tpope/vim-abolish'
  use 'tpope/vim-bundler'
  use 'tpope/vim-commentary'
  use 'tpope/vim-dadbod'
  use 'tpope/vim-endwise'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-git'
  use 'tpope/vim-heroku'
  use 'tpope/vim-rails'
  use 'tpope/vim-rake'
  use 'tpope/vim-repeat'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'wellle/targets.vim'
  use 'wincent/loupe'
  -- Simple plugins can be specified as strings
  -- use '9mm/vim-closer'

  -- -- Lazy loading:
  -- -- Load on specific commands
  -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- -- Load on an autocommand event
  -- use {'andymass/vim-matchup', event = 'VimEnter'}

  -- -- Load on a combination of conditions: specific filetypes or commands
  -- -- Also run code after load (see the "config" key)
  -- use {
  --   'w0rp/ale',
  --   ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
  --   cmd = 'ALEEnable',
  --   config = 'vim.cmd[[ALEEnable]]'
  -- }

  -- -- Plugins can have dependencies on other plugins
  -- use {
  --   'haorenW1025/completion-nvim',
  --   opt = true,
  --   requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  -- }

  -- -- Plugins can also depend on rocks from luarocks.org:
  -- use {
  --   'my/supercoolplugin',
  --   rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
  -- }

  -- -- You can specify rocks in isolation
  -- use_rocks 'penlight'
  -- use_rocks {'lua-resty-http', 'lpeg'}

  -- -- Local plugins can be included
  -- use '~/projects/personal/hover.nvim'

  -- -- Plugins can have post-install/update hooks
  -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- -- Post-install/update hook with neovim command
  -- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- -- Post-install/update hook with call of vimscript function with argument
  -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- -- Use specific branch, dependency and run lua file after load
  -- use {
  --   'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }

  -- -- Use dependency and run lua function after load
  -- use {
  --   'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
  --   config = function() require('gitsigns').setup() end
  -- }

  -- -- You can specify multiple plugins in a single call
  -- use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

  -- -- You can alias plugin names
  -- use {'dracula/vim', as = 'dracula'}
end)

