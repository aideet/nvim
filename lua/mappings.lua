local map = vim.api.nvim_set_keymap
local set = vim.keymap.set

map('i', 'jk', '<Esc>', { noremap = true })
--map('n', '<A>v', '<C-V>', { noremap = true })


-- neovide scaling
vim.keymap.set("n", "<C-+>", function()
  change_scale_factor(0.20)
end)
vim.keymap.set("n", "<C-->", function()
  change_scale_factor(-0.20)
end)
vim.keymap.set("n", "<C-0>", function()
  vim.g.neovide_scale_factor = 1.0
end)

vim.keymap.set('n', 'K', show_documentation, { silent = true })

-- Nvim Tree
map('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true, noremap = true }) 
map('n', '<leader>e', ':NvimTreeFocus<CR>', { silent = true, noremap = true })

-- window navigation
map('n', '<C-h>', '<C-w>h', { noremap = true })
map('n', '<C-l>', '<C-w>l', { noremap = true })
map('n', '<C-j>', '<C-w>j', { noremap = true })
map('n', '<C-k>', '<C-w>k', { noremap = true })

-- line numbers
map('n', '<leader>n', ':set nu!<CR>', { silent = true, noremap = true })
map('n', '<leader>rn', ':set rnu!<CR>', { silent = true, noremap = true })

-- Float term
map('n', '<A-i>', ':lua require("FTerm").toggle()<CR>', { silent = true, noremap = true })
map('t', '<A-i>', '<C-\\><C-n>:lua require("FTerm").toggle()<CR>', { silent = true, noremap = true }) -- see https://www.reddit.com/r/neovim/comments/cger8p/how_quickly_close_a_terminal_buffer/

-- startify
map('n', '<leader>d', ':Startify<CR>', { silent = true, noremap = true }) 

-- LSP
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
set('n', '<leader>f', vim.diagnostic.open_float)
set('n', '[d', vim.diagnostic.goto_prev)
set('n', ']d', vim.diagnostic.goto_next)
set('n', '<leader>q', vim.diagnostic.setloclist)


-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local lsp_opts = {buffer = ev.buf }
        set('n', 'gD', vim.lsp.buf.declaration, lsp_opts)
        set('n', 'gd', vim.lsp.buf.definition, lsp_opts)
        set('n', 'K', vim.lsp.buf.hover, lsp_opts)
        set('n', 'gi', vim.lsp.buf.implementation, lsp_opts)
        set('n', '<C-k>', vim.lsp.buf.signature_help, lsp_opts)
        set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, lsp_opts)
        set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, lsp_opts)
        set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, lsp_opts)
        set('n', '<leader>D', vim.lsp.buf.type_definition, lsp_opts)
        set('n', '<leader>r', vim.lsp.buf.rename, lsp_opts)
        set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, lsp_opts)
        set('n', 'gr', vim.lsp.buf.references, lsp_opts)
        set('n', '<leader>cf', function()
            vim.lsp.buf.format { async = true }
        end, lsp_opts)
    end,
})

-- LuaSnip

