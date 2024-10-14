-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- system clipboard support
vim.opt.clipboard = 'unnamedplus'

require('opts')
require('functions')

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

require('mappings')
require('styles')

-- see https://github.com/kevinhwang91/nvim-ufo/issues/57
vim.cmd("au BufEnter * silent! setlocal foldlevelstart=99")

-- set_light_theme()
set_dark_theme()
