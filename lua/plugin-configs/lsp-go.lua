
local lsp_opts = require("plugin-configs.lspconfig")

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig["gopls"].setup({
  capabilities = lsp_opts.capabilities,
  on_attach = lsp_opts.on_attach,
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  settings = {
    gopls = {
      gofumpt = true
    }
  }
})

vim.api.nvim_create_autocmd(
  { "BufWritePost" },
  { pattern = "*.go", command = "GoFmt" }
)
