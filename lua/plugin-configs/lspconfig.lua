-- Activate venv before starting the LSP
require('venv-lsp').init()

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

local lspconfig = require("lspconfig")

-- could move to mason.lua

lspconfig.yamlls.setup {
  on_attach = options.on_attach,
  capabilities = options.capabilities,
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.yaml"] = "/openapi.yaml"
        -- ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.yaml"] = "/openapi.yaml"
      }
    }
  }
}
lspconfig.bashls.setup{}
lspconfig.marksman.setup{}
lspconfig.ruff.setup{}
vim.api.nvim_create_autocmd(
  { "BufWritePre" },
  { 
    pattern = "*.py", 
    callback = function(ev)
        vim.lsp.buf.format { async = false }
    end
  }
)

lspconfig.pyright.setup{
    settings = {
        pyright = {
          -- Using Ruff's import organizer
          disableOrganizeImports = true,
        },
        python = {
          analysis = {
            -- Ignore all files for analysis to exclusively use Ruff for linting
            ignore = { '*' },
          },
        },
    },
}
-- lspconfig.helm_ls.setup{}
require'lspconfig'.helm_ls.setup {
  on_attach = options.on_attach,
  capabilities = options.capabilities,
  settings = {
    ['helm-ls'] = {
      yamlls = {
        path = "yaml-language-server",
      }
    }
  }
}
return options

