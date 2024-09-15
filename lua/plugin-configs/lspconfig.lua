
local options = {
    inlay_hints = { enabled = true },   
}
-- export on_attach & capabilities for custom lspconfigs

options.on_attach = function(client, bufnr)
end

--options.capabilities = vim.lsp.protocol.make_client_capabilities()
options.capabilities = require("cmp_nvim_lsp").default_capabilities()

-- nvim-ufo folding settings
options.capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

-- could move to mason.lua
require'lspconfig'.marksman.setup{}
require'lspconfig'.ruff.setup{}
require'lspconfig'.pyright.setup{}

return options

