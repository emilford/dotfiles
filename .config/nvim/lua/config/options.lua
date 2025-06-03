vim.g.mapleader = ","

vim.opt.breakindent = true
vim.opt.colorcolumn = "+1"
vim.opt.confirm = true
vim.opt.cpoptions:append("$")
vim.opt.diffopt:append({ "algorithm:histogram", "indent-heuristic", "vertical" })
vim.opt.diffopt:remove("linematch:40")
vim.opt.fillchars = { eob = " " }
vim.opt.ignorecase = true
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = false
vim.opt.shiftround = true
vim.opt.shortmess:append({ I = true, W = true })
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
vim.opt.statusline = '%{""}'
vim.opt.termguicolors = true
vim.opt.wildmode = { "list:longest", "list:full" }
vim.opt.winborder = "rounded"
