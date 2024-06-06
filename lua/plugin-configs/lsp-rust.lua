local bufnr = vim.api.nvim_get_current_buf()

local on_attach = function(_, bufnr) 
    vim.keymap.set("n", "<leader>a", function()
            vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
        end,
        { silent = true, buffer = bufnr, desc = "Code action"}
    )
    vim.keymap.set("n", "<C-space>", function()
            vim.cmd.RustLsp('hover', 'actions') -- supports rust-analyzer's grouping
        end,
        { silent = true, buffer = bufnr, desc = "Code completion"}
    )
    vim.keymap.set("n", "<leader>h", function()
            vim.cmd.RustLsp('renderDiagnostic') -- supports rust-analyzer's grouping
        end,
        { silent = true, buffer = bufnr, desc = "Preview Diagnostics"}
    )
    vim.keymap.set("n", "<leader>rcc", function()
            vim.cmd.RustLsp('openCargo') -- supports rust-analyzer's grouping
        end,
        { silent = true, buffer = bufnr, desc = "Open Cargo"}
    )
end

vim.g.rustaceanvim = {
    tools = {
        hover_actions = {
          auto_focus = true,      
        },
        float_win_config = {
          border = 'rounded',
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
  { "BufWritePre" },
  { 
    pattern = "*.rs", 
    callback = function(ev)
        vim.lsp.buf.format { async = false }
    end
  }
)
