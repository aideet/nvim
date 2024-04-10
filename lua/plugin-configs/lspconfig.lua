
local options = {
    
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

return options

