
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

require('lspconfig.ui.windows').default_options = {
  border = _border
}

vim.fn.sign_define("DiagnosticSignError",
    {text = "", texthl = "DiagnosticSignError", numhl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
    {text = "", texthl = "DiagnosticSignWarn", numhl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
    {text = "", texthl = "DiagnosticSignInfo", numhl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
    {text = "", texthl = "DiagnosticSignHint", numhl = "DiagnosticSignHint"})

vim.cmd('highlight Search guibg=DarkYellow guifg=Black')
vim.cmd('highlight CurSearch guibg=Yellow guifg=Blue gui=bold')
-- vim.api.nvim_set_hl(0, 'Search', { bg=DarkYellow, fg=Black, ctermbg=DarkYellow, ctermfg=Black })
