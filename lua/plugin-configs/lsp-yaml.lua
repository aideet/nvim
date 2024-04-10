
local lsp_opts = require("plugin-configs.lspconfig")

local lspconfig = require("lspconfig")

lspconfig['yamlls'].setup {
  on_attach = lsp_opts.on_attach,
  capabilities = lsp_opts.capabilities,
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.yaml"] = "/openapi.yaml"
        -- ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.yaml"] = "/openapi.yaml"
      }
    }
  }
}


