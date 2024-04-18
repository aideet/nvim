-- vim: foldmethod=marker

local map = vim.api.nvim_set_keymap
local set = vim.keymap.set

-- which-key {{{ 
local wk = require("which-key")
-- wk.register({
--    ["<leader>"] = {
--        name = "Nvim Tree",
--        e = { ":NvimTreeFocus<CR>", "Focus Nvim Tree" },
--
--    }
-- })
-- }}}
-- escape to NORMAL mode {{{ 
set('i', 'jk', '<Esc>', { noremap = true })
-- }}}
-- Open with system app {{{
map('n', 'gx', "<Cmd>silent execute '!xdg-open '.shellescape(expand('<cfile>'), 1)<CR>", { silent = true, noremap = true })
-- }}}
-- un-highlight search occurrences {{{
map('n', '<leader>H', '<Cmd>noh<CR>', { silent = true, noremap = true })
-- }}}
-- Nvim Tree {{{
map('n', '<leader>e', ':NvimTreeFocus<CR>', { silent = true, noremap = true })
map('n', '<leader>E', ':NvimTreeClose<CR>', { silent = true, noremap = true })
-- }}}
-- nnn file browser {{{
map('n', '<leader>np', ':NnnPicker<CR>', { silent = true, noremap = true })
map('n', '<leader>ne', ':NnnExplorer<CR>', { silent = true, noremap = true })
-- }}}
-- window navigation {{{
map('n', '<C-h>', '<C-w>h', { noremap = true })
map('n', '<C-l>', '<C-w>l', { noremap = true })
map('n', '<C-j>', '<C-w>j', { noremap = true })
map('n', '<C-k>', '<C-w>k', { noremap = true })
-- }}}
-- buffer navigation {{{
map('i', '<C-h>', '<Left>', { noremap = true })
map('i', '<C-l>', '<Right>', { noremap = true })
map('i', '<C-j>', '<Down>', { noremap = true })
map('i', '<C-k>', '<Up>', { noremap = true })

set({'n', 'i'}, '<A-k>', '<C-y>', { noremap = true })
set({'n', 'i'}, '<A-j>', '<C-e>', { noremap = true })
-- }}}
-- line numbers {{{
map('n', '<leader>n', ':set nu!<CR>', { silent = true, noremap = true })
map('n', '<leader>rn', ':set rnu!<CR>', { silent = true, noremap = true })
-- }}}
-- Float term {{{
map('n', '<A-i>', ':lua require("FTerm").toggle()<CR>', { silent = true, noremap = true })
map('t', '<A-i>', '<C-\\><C-n>:lua require("FTerm").toggle()<CR>', { silent = true, noremap = true }) -- see https://www.reddit.com/r/neovim/comments/cger8p/how_quickly_close_a_terminal_buffer/
-- }}}
-- startify {{{
map('n', '<leader>^', ':Startify<CR>', { silent = true, noremap = true }) 
-- }}}
-- fugitive {{{
map('n', '<leader>gg', '<Cmd>Git<CR>', { silent = true, noremap = true })
-- }}}
-- GitSigns {{{
map('n', '<leader>ga', '<Cmd>Gitsigns toggle_current_line_blame<CR>', { silent = true, noremap = true })
-- }}}
-- LSP float documentation {{{
-- set('n', 'K', show_documentation, { silent = true }) -- obsolete with vim.lsp.buf.hover
-- }}}
-- LSP {{{
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
set('n', '<leader>d', vim.diagnostic.open_float)
set('n', '[d', vim.diagnostic.goto_prev)
set('n', ']d', vim.diagnostic.goto_next)
set('n', '<leader>q', vim.diagnostic.setloclist)
set('n', '<leader>D', '<CMD>DiagnosticsToggleVirtualText<CR>')

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
        set('n', 'gi', vim.lsp.buf.implementation, lsp_opts)
        set('n', 'gr', vim.lsp.buf.references, lsp_opts)
        set('n', 'gt', vim.lsp.buf.type_definition, lsp_opts)
        set('n', 'ö', vim.lsp.buf.hover, lsp_opts)
        set({'n', 'i'}, '<C-ö>', vim.lsp.buf.signature_help, lsp_opts)
        set('n', '<leader>i', peek_definition, lsp_opts)
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
-- }}}
-- crates {{{
local crates = require("crates")
local crates_opts = { silent = true }

set("n", "<leader>ct", crates.toggle, crates_opts)

set("n", "<leader>cr", crates.reload, crates_opts)

set("n", "<leader>cv", crates.show_versions_popup, crates_opts)
set("n", "<leader>cf", crates.show_features_popup, crates_opts)
set("n", "<leader>cd", crates.show_dependencies_popup, crates_opts)

set("n", "<leader>cu", crates.update_crate, crates_opts)
set("v", "<leader>cu", crates.update_crates, crates_opts)
set("n", "<leader>ca", crates.update_all_crates, crates_opts)
set("n", "<leader>cU", crates.upgrade_crate, crates_opts)
set("v", "<leader>cU", crates.upgrade_crates, crates_opts)
set("n", "<leader>cA", crates.upgrade_all_crates, crates_opts)

set("n", "<leader>cx", crates.expand_plain_crate_to_inline_table, crates_opts)
set("n", "<leader>cX", crates.extract_crate_into_table, crates_opts)

set("n", "<leader>cH", crates.open_homepage, crates_opts)
set("n", "<leader>cR", crates.open_repository, crates_opts)
set("n", "<leader>cD", crates.open_documentation, crates_opts)
set("n", "<leader>cC", crates.open_crates_io, crates_opts)
-- }}}
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
-- Telescope {{{
map('n', '<leader>ff', ':Telescope find_files<CR>', { silent = true, noremap = true})
map('n', '<leader>fa', ':Telescope find_files follow=true no_ignore=true hidden=true<CR>', { silent = true, noremap = true})
map('n', '<leader>fw', ':Telescope live_grep<CR>', { silent = true, noremap = true})
map('n', '<leader>fb', ':Telescope buffers<CR>', { silent = true, noremap = true})
map('n', '<leader>fh', ':Telescope help_tags<CR>', { silent = true, noremap = true})
map('n', '<leader>fo', ':Telescope oldfiles<CR>', { silent = true, noremap = true})
map('n', '<leader>fz', ':Telescope current_buffer_fuzzy_find<CR>', { silent = true, noremap = true})
map('n', '<leader>fl', ':Telescope spell_suggest<CR>', { silent = true, noremap = true})
-- map('n', '<leader>fp', ':Telescope terms<CR>', { silent = true, noremap = true})
map('n', '<leader>fm', ':Telescope marks<CR>', { silent = true, noremap = true})
map('n', '<leader>fr', ':Telescope registers<CR>', { silent = true, noremap = true})
map('n', '<leader>fs', ':Telescope search_history<CR>', { silent = true, noremap = true})
map('n', '<leader>fk', ':Telescope keymaps<CR>', { silent = true, noremap = true})
map('n', '<leader>ft', ':TodoTelescope<CR>', { silent = true, noremap = true})

map('n', '<leader>gc', ':Telescope git_commits<CR>', { silent = true, noremap = true})
map('n', '<leader>gs', ':Telescope git_status<CR>', { silent = true, noremap = true})
map('n', '<leader>gb', ':Telescope git_branches<CR>', { silent = true, noremap = true})

map('n', '<leader>tp', ':Telescope diagnostics<CR>', { silent = true, noremap = true})
map('n', '<leader>td', ':Telescope lsp_definitions<CR>', { silent = true, noremap = true})
map('n', '<leader>ts', ':Telescope lsp_document_symbols<CR>', { silent = true, noremap = true})
map('n', '<leader>tS', ':Telescope lsp_document_symbols ignore_symbols=variable<CR>', { silent = true, noremap = true})
map('n', '<leader>tw', ':Telescope lsp_workspace_symbols<CR>', { silent = true, noremap = true})
map('n', '<leader>tW', ':Telescope lsp_dynamic_workspace_symbols<CR>', { silent = true, noremap = true})
map('n', '<leader>tm', ':Telescope lsp_implementations<CR>', { silent = true, noremap = true})
map('n', '<leader>ti', ':Telescope lsp_incoming_calls<CR>', { silent = true, noremap = true})
map('n', '<leader>to', ':Telescope lsp_outgoing_calls<CR>', { silent = true, noremap = true})
map('n', '<leader>tr', ':Telescope lsp_references<CR>', { silent = true, noremap = true})
map('n', '<leader>tt', ':Telescope lsp_type_definitions<CR>', { silent = true, noremap = true})
-- }}}
-- Markdown preview {{{
map('n', '<leader>mdp', ':MarkdownPreview<CR>', { silent = true, noremap = true})
map('n', '<leader>mds', ':MarkdownPreviewStop<CR>', { silent = true, noremap = true})
map('n', '<leader>mdt', ':MarkdownPreviewToggle<CR>', { silent = true, noremap = true})
-- }}}
-- dap {{{
map('n', '<leader>db', ':DapToggleBreakpoint<CR>', { silent = true, noremap = true})
map('n', '<f5>', ':DapContinue<CR>', { silent = true, noremap = true})
map('n', '<f6>', ':DapTerminate<CR>', { silent = true, noremap = true})
map('n', '<f7>', ':DapStepInto<CR>', { silent = true, noremap = true})
map('n', '<f8>', ':DapStepOut<CR>', { silent = true, noremap = true})
map('n', '<f9>', ':DapStepOver<CR>', { silent = true, noremap = true})
map('n', '<f10>', ':DapPlayPause<CR>', { silent = true, noremap = true})
map('n', '<leader>dr', ':DapToggleRepl<CR>', { silent = true, noremap = true})
map('n', '<leader>df', ':DapUiFloat<CR>', { silent = true, noremap = true})
map('n', '<leader>du', ':DapUiToggle<CR>', { silent = true, noremap = true})
set('n', '<leader>ds', function ()
            local widgets = require('dap.ui.widgets');
            local sidebar = widgets.sidebar(widgets.scopes);
            sidebar.open();
        end,
        { silent = true, noremap = true}
    )
-- }}}
-- dap-rust {{{
-- see lsp-rust.lua
-- }}}
-- Dadbod DB Client {{{
map('n', '<leader>pu', ':DBUIToggle<CR>', { silent = true, noremap = true})
map('v', '<leader>pe', ':DB<CR>', { silent = true, noremap = true})
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
