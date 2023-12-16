-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


require('opts')
require('functions')
require('mappings')
require('plugins')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.cmd.colorscheme "catppuccin"
