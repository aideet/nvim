
local on_attach = require("plugin-configs.lspconfig").on_attach
local capabilities = require("plugin-configs.lspconfig").capabilities

local options = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities;
  }

}

return options
