local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "em.plugins" },
    { import = "em.plugins.config.splitjoin" },
    { import = "em.plugins.config.nvim-colorizer" },
    { import = "em.plugins.config.nvim-treesitter" },
    { import = "em.plugins.config.harpoon" },
    { import = "em.plugins.config.rose-pine" },
    { import = "em.plugins.config.ultisnips" },
    { import = "em.plugins.config.vim-tmux-runner" },
    { import = "em.plugins.config.zen-mode" },
    { import = "em.plugins.config.vim-test" },
    { import = "em.plugins.config.fidget" },
    { import = "em.plugins.config.cmp" },
    { import = "em.plugins.config.vim-easy-align" },
    { import = "em.plugins.config.indent-blankline" },
    { import = "em.plugins.config.vim-dirtytalk" },
    { import = "em.plugins.config.vim-fugitive" },
    { import = "em.plugins.config.loupe" },
    { import = "em.plugins.config.nvim-autopairs" },
    { import = "em.plugins.config.which-key" },
    { import = "em.plugins.config.comment" },
    { import = "em.plugins.config.telescope" },
    { import = "em.plugins.config.vim-dadbod" },
    { import = "em.plugins.config.readline" },
    { import = "em.plugins.config.zk-nvim" },
    { import = "em.plugins.config.vim-gista" },
    { import = "em.plugins.config.null-ls" },
    { import = "em.plugins.config.lspconfig" },
    { import = "em.plugins.config.lspsaga" },
  },
})
