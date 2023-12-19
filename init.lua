-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


require('opts')
require('functions')
require('plugins')
require('mappings')

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

-- enable borders for floating windows
-- see https://vi.stackexchange.com/questions/39074/user-borders-around-lsp-floating-windows
local _border = "rounded"
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = _border
  }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = _border
  }
)
vim.diagnostic.config{
  float={border=_border}
}

vim.fn.sign_define("DiagnosticSignError",
    {text = "", texthl = "DiagnosticSignError", numhl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
    {text = "", texthl = "DiagnosticSignWarn", numhl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
    {text = "", texthl = "DiagnosticSignInfo", numhl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
    {text = "", texthl = "DiagnosticSignHint", numhl = "DiagnosticSignHint"})

require("lazy").setup("plugins")

vim.cmd.colorscheme "catppuccin"
