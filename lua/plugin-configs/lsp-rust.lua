local bufnr = vim.api.nvim_get_current_buf()

local on_attach = function(_, bufnr) 
    vim.keymap.set("n", "<leader>a", function()
            vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
        end,
        { silent = true, buffer = bufnr }
    )
    vim.keymap.set("n", "<C-space>", function()
            vim.cmd.RustLsp('hover', 'actions') -- supports rust-analyzer's grouping
        end,
        { silent = true, buffer = bufnr }
    )
    vim.keymap.set("n", "<leader>h", function()
            vim.cmd.RustLsp('renderDiagnostic') -- supports rust-analyzer's grouping
        end,
        { silent = true, buffer = bufnr }
    )
    vim.keymap.set("n", "<leader>cc", function()
            vim.cmd.RustLsp('openCargo') -- supports rust-analyzer's grouping
        end,
        { silent = true, buffer = bufnr }
    )
end

vim.g.rustaceanvim = {
    tools = {
        hover_actions = {
          auto_focus = true,      
        },
    },
    server = {
        on_attach = on_attach,
        default_settings = {
          -- rust-analyzer language server configuration
          ['rust-analyzer'] = {
          },
        },
    },
}

vim.api.nvim_create_autocmd(
  { "BufWritePost" },
  { 
    pattern = "*.rs", 
    callback = function(ev)
        vim.lsp.buf.format { async = true }
    end
  }
)
