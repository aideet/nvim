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

-- LSP preview defintion (see https://github.com/neovim/neovim/pull/12368)
local function preview_location_callback(_, result, method, _)
  if result == nil or vim.tbl_isempty(result) then
    vim.lsp.log.info(method, 'No location found')
    return nil
  end
  if vim.tbl_islist(result) then
    vim.lsp.util.preview_location(result[1])
  else
    vim.lsp.util.preview_location(result)
  end
end

function peek_definition()
  local params = vim.lsp.util.make_position_params()
  return vim.lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
end


require('mappings')

vim.cmd.colorscheme "catppuccin"
