-- vim: foldmethod=marker

local map = vim.api.nvim_set_keymap
local set = vim.keymap.set

local wk = require("which-key")

-- Normal Mode {{{
wk.register({ 
    ["<leader>w"] = { "<Cmd>WhichKey<CR>", "Which Key" },
    ["<leader>H"] = { "<Cmd>noh<CR>", "Search Highlight Off" },
    ["<leader>e"] = { ":NvimTreeFocus<CR>", "Nvim Tree Focus" },
    ["<leader>E"] = { ":NvimTreeClose<CR>", "Nvim Tree Close" },
    ["<leader>M"] = { "<CMD>RustLsp expandMacro<CR>", "Expand rust macro" },
    ["<leader>^"] = { ":Startify<CR>", "Startify" },

    -- Debug {{{
    ["<f5>"] = { ":DapContinue<CR>", "Debug continue" },
    ["<f6>"] = { ":DapTerminate<CR>", "Debug stop" },
    ["<f7>"] = { ":DapStepInto<CR>", "Debug step into" },
    ["<f8>"] = { ":DapStepOut<CR>", "Debug step out" },
    ["<f9>"] = { ":DapStepOver<CR>", "Debug step over" },
    ["<f10>"] = { ":DapPlayPause<CR>", "Debug play/pause" },
    -- }}}

    -- Window switch {{{
    ["<C-h>"] = { "<C-w>h", "Window switch left" },
    ["<C-l>"] = { "<C-w>l", "Window switch right" },
    ["<C-j>"] = { "<C-w>j", "Window switch down" },
    ["<C-k>"] = { "<C-w>k", "Window switch up" },
    -- }}}

    -- Goto / Git {{{
    ["<leader>g"] = {
       name = "Goto / Git",
       x = { "<Cmd>silent execute '!xdg-open '.shellescape(expand('<cfile>'), 1)<CR>", "Open with system app" },
       g = { "<Cmd>Git<CR>", "Git tool" },
       a = { "<Cmd>Gitsigns toggle_current_line_blame<CR>", "Git annotations" },
       c = { ":Telescope git_commits<CR>", "Git commits" },
       s = { ":Telescope git_status<CR>", "Git status" },
       b = { ":Telescope git_branches<CR>", "Git branches" },
    },
    -- }}}

    -- Line numbers {{{
    ["<leader>n"] = {
       name = "Line Numbers",
       n = { ":set nu!<CR>", "Toggle line numbers" },
       r = { ":set rnu!<CR>", "Toggle relative line numbers" },
    },
    -- }}}

    -- Markdown preview {{{
    ["<leader>m"] = {
       name = "Markdown Preview",
       p = { ":MarkdownPreview<CR>", "Preview" },
       s = { ":MarkdownPreviewStop<CR>", "Preview stop" },
       t = { ":MarkdownPreviewToggle<CR>", "Preview toggle" },
    },
    -- }}}

    -- Find {{{
    ["<leader>f"] = {
       name = "Find",
       p = { ":NnnPicker<CR>", "File picker" },
       e = { ":NnnExplorer<CR>", "File explorer" },
       f = { ":Telescope find_files<CR>", "Find files" },
       a = { ":Telescope find_files follow=true no_ignore=true hidden=true<CR>", "Find hidden files" },
       w = { ":Telescope live_grep<CR>", "Grep" },
       b = { ":Telescope buffers<CR>", "Find buffer" },
       h = { ":Telescope help_tags<CR>", "Find help tags" },
       o = { ":Telescope oldfiles<CR>", "Find old files" },
       z = { ":Telescope current_buffer_fuzzy_find<CR>", "Find fuzzy in buffer" },
       l = { ":Telescope spell_suggest<CR>", "Find spelling" },
       m = { ":Telescope marks<CR>", "Find marks" },
       r = { ":Telescope registers<CR>", "Find registers" },
       s = { ":Telescope search_history<CR>", "Find search history" },
       k = { ":Telescope keymaps<CR>", "Find keymaps" },
       t = { ":TodoTelescope<CR>", "Find todos" },
    },
    -- }}}

    -- Lsp Telescope {{{
    ["<leader>t"] = {
       name = "LSP Telescope",
       p = { ":Telescope diagnostics<CR>", "Diagnostics" },
       d = { ":Telescope lsp_definitions<CR>", "Definitions" },
       s = { ":Telescope lsp_document_symbols<CR>", "Document symbols" },
       S = { ":Telescope lsp_document_symbols ignore_symbols=variable<CR>", "Document symbols (no vars)" },
       w = { ":Telescope lsp_workspace_symbols<CR>", "Workspace symbols" },
       W = { ":Telescope lsp_dynamic_workspace_symbols<CR>", "Dynamic document symbols" },
       m = { ":Telescope lsp_implementations<CR>", "Implementations" },
       i = { ":Telescope lsp_incoming_calls<CR>", "Incoming calls" },
       o = { ":Telescope lsp_outgoing_calls<CR>", "Outgoing calls" },
       r = { ":Telescope lsp_references<CR>", "References" },
       x = { ":Telescope lsp_type_definitions<CR>", "Type definitions" },
    },
    -- }}}

    -- Crates {{{
    ["<leader>c"] = {
       name = "Crates",
       t = { "<CMD>lua require('crates').toggle()<CR>", "Toggle annotations" },
       r = { "<CMD>lua require('crates').reload()<CR>", "Reload" },
       v = { "<CMD>lua require('crates').show_versions_popup()<CR>", "Show version popup" },
       f = { "<CMD>lua require('crates').show_features_popup()<CR>", "Show features popup" },
       d = { "<CMD>lua require('crates').show_dependencies_popup()<CR>", "Show dependencies popup" },
       u = { "<CMD>lua require('crates').update_crate()<CR>", "Update crate" },
       a = { "<CMD>lua require('crates').update_all_crates()<CR>", "Update all crates" },
       U = { "<CMD>lua require('crates').upgrade_crate()<CR>", "Upgrade crate" },
       A = { "<CMD>lua require('crates').upgrade_all_crates()<CR>", "Upgrade all crates" },
       x = { "<CMD>lua require('crates').expand_plain_crate_to_inline_table()<CR>", "Expand to inline table" },
       X = { "<CMD>lua require('crates').extract_crate_into_table()<CR>", "Extract into table" },
       H = { "<CMD>lua require('crates').open_homepage()<CR>", "Homepage" },
       R = { "<CMD>lua require('crates').open_repository()<CR>", "Repository" },
       D = { "<CMD>lua require('crates').open_documentation()<CR>", "Documentation" },
       C = { "<CMD>lua require('crates').open_crates_io()<CR>", "Crates.io" },
    },
    -- }}}

    -- Debug {{{
    ["<leader>d"] = {
       name = "Debug",
       b = { ":DapToggleBreakpoint<CR>", "Toggle breakpoint" },
       r = { ":DapToggleRepl<CR>", "Toggle Repl" },
       f = { ":DapUiFloat<CR>", "UI float" },
       u = { ":DapUiToggle<CR>", "UI toggle" },
    },
    -- }}}

    -- DB {{{
    ["<leader>p"] = {
       name = "DB",
       u = { ":DBUIToggle<CR>", "DB UI toggle" },
       f = { ":DBUIFindBuffer<CR>", "DB find buffer" },
    },
    -- }}}

})
-- }}}


-- Visual Mode {{{
wk.register({ -- Visual Mode
    -- Crates {{{
    ["<leader>c"] = {
       name = "Crates",
       u = { "<CMD>lua require('crates').update_crate()<CR>", "Update crate" },
       U = { "<CMD>lua require('crates').upgrade_crate()<CR>", "Upgrade crate" },
    },
    -- }}}

    -- DB {{{
    ["<leader>p"] = {
       name = "DB",
       e = { ":DB<CR>", "DB execute" },
    },
    -- }}}
}, { mode = "v"})
-- }}}

-- escape to NORMAL mode {{{ 
set('i', 'jk', '<Esc>', { noremap = true })
-- }}}
-- buffer navigation {{{
map('i', '<C-h>', '<Left>', { noremap = true })
map('i', '<C-l>', '<Right>', { noremap = true })
map('i', '<C-j>', '<Down>', { noremap = true })
map('i', '<C-k>', '<Up>', { noremap = true })

-- scrolling
set({'n', 'i'}, '<A-k>', '<C-y>', { noremap = true })
set({'n', 'i'}, '<A-j>', '<C-e>', { noremap = true })
-- }}}
-- Float term {{{
map('n', '<A-i>', ':lua require("FTerm").toggle()<CR>', { silent = true, noremap = true })
map('t', '<A-i>', '<C-\\><C-n>:lua require("FTerm").toggle()<CR>', { silent = true, noremap = true }) -- see https://www.reddit.com/r/neovim/comments/cger8p/how_quickly_close_a_terminal_buffer/
-- }}}
-- LSP {{{
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
set('n', '<leader>d', vim.diagnostic.open_float)
set('n', '[d', vim.diagnostic.goto_prev)
set('n', ']d', vim.diagnostic.goto_next)
set('n', '<leader>q', vim.diagnostic.setloclist)
set('n', '<leader>D', '<CMD>LspDiagnosticsToggleVirtualText<CR>')

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- local lsp_opts = {buffer = ev.buf }
        -- local wk = require("which-key")
        -- wk.register({
        --    ["g"] = {
        --        name = "LSP Goto",
        --        D = { "vim.lsp.buf.declaration", "Goto declaration" },
        --        d = { "vim.lsp.buf.definition", "Goto definition" },
        --        i = { "vim.lsp.buf.implementation", "Goto implementation" },
        --        r = { "vim.lsp.buf.references", "Goto references" },
        --        t = { "vim.lsp.buf.type_definition", "Goto type definition" },
        --    }
        -- }, lsp_opts )
        set('n', 'gD', vim.lsp.buf.declaration, lsp_opts)
        set('n', 'gd', vim.lsp.buf.definition, lsp_opts)
        set('n', 'gi', vim.lsp.buf.implementation, lsp_opts)
        set('n', 'gr', vim.lsp.buf.references, lsp_opts)
        set('n', 'gt', vim.lsp.buf.type_definition, lsp_opts)
        set('n', 'ö', vim.lsp.buf.hover, lsp_opts)
        set({'n', 'i'}, '<C-ö>', vim.lsp.buf.signature_help, lsp_opts)
        set('n', '<leader>i', "<CMD>lua require('goto-preview').goto_preview_definition()<CR>", lsp_opts)
        set('n', '<leader>I', "<CMD>lua require('goto-preview').goto_preview_type_definition()<CR>", lsp_opts)
        set('n', '<leader>k', "<CMD>lua require('goto-preview').close_all_win()<CR>", lsp_opts)
        set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, lsp_opts)
        set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, lsp_opts)
        set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, lsp_opts)
        set('n', '<leader>r', vim.lsp.buf.rename, lsp_opts)
        set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, lsp_opts)
        set('n', '<leader>lf', function()
            vim.lsp.buf.format { async = true }
        end, lsp_opts)
    end,
})
-- Comment {{{
set('n', '<leader>/', function()
        require("Comment.api").toggle.linewise.current()
      end,
      {}
)
set('v', '<leader>/', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", {})
set('n', '<C-7>', function()
        require("Comment.api").toggle.linewise.current()
        vim.cmd('execute "norm j"')
      end,
      {}
)
-- }}}
-- dap {{{
set('n', '<leader>ds', function ()
            local widgets = require('dap.ui.widgets');
            local sidebar = widgets.sidebar(widgets.scopes);
            sidebar.open();
        end,
        { silent = true, noremap = true}
    )
-- }}}
-- barbar (tabs) {{{
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', { silent = true, noremap = true })
map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', { silent = true, noremap = true })
map('n', '<A-.>', '<Cmd>BufferNext<CR>', { silent = true, noremap = true })
map('n', '<Tab>', '<Cmd>BufferNext<CR>', { silent = true, noremap = true })
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', { silent = true, noremap = true })
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', { silent = true, noremap = true })
-- map('n', '<A-p>', '<Cmd>BufferPin<CR>', { silent = true, noremap = true })
map('n', '<A-c>', '<Cmd>BufferClose<CR>', { silent = true, noremap = true })
map('n', '<A-o>', '<Cmd>BufferCloseAllButCurrent<CR>', { silent = true, noremap = true })
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<A-p>', '<Cmd>BufferPick<CR>', { silent = true, noremap = true })
-- }}}
-- Todo Comment {{{
map('n', '<leader>ot', ':TodoQuickFix<CR>', { silent = true, noremap = true})
-- }}}
-- ufo {{{
set('n', 'zR', require('ufo').openAllFolds)
set('n', 'zM', require('ufo').closeAllFolds)
set('n', 'zr', require('ufo').openFoldsExceptKinds)
set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
set('n', 'zz', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
        vim.lsp.buf.hover()
    end
end)
-- }}}
