-- vim: foldmethod=marker

local map = vim.api.nvim_set_keymap
local set = vim.keymap.set

-- escape to NORMAL mode {{{ 
set('i', 'jk', '<Esc>', { noremap = true })
-- }}}

-- WhichKey {{{ 
set({'n', 'v', 'i'}, '<A-w>', '<Cmd>WhichKey<CR>', { noremap = true, desc = "WhichKey" })

local wk = require("which-key")
wk.add( 
  {
    { "<leader>c", group = "Crates" },
    { "<leader>d", group = "Debug" },
    { "<leader>f", group = "Find" },
    { "<leader>g", group = "Goto / Git" },
    { "<leader>gm", group = "Giti merge conflicts" },
    { "<leader>m", group = "Markdown Preview" },
    { "<leader>n", group = "Line Numbers" },
    { "<leader>o", group = "Todos / Diagnostics" },
    { "<leader>p", group = "DB" },
    { "<leader>p", group = "DB", mode = "v" },
    { "<leader>r", group = "Rust" },
    { "<leader>rc", group = "Crates" },
    { "<leader>rc", group = "Crates", mode = "v" },
    { "<leader>rt", group = "Neo Test" },
    { "<leader>s", group = "Color schemes" },
    { "<leader>t", group = "LSP Telescope" },
    { "<leader>w", group = "Workspace" },
    { "[", group = "Previous match" },
    { "]", group = "Next match" },
    { "g", group = "Lsp / Moves / Search" },
    { "z", group = "Folds / Spelling / Scrolling" },
    { "zl", group = "Spell check language" },
  }
)
-- }}}

-- Open with system app {{{
map('n', '<leader>gx', "<Cmd>silent execute '!xdg-open '.shellescape(expand('<cfile>'), 1)<CR>", { silent = true, noremap = true, desc = "Open with system app" })
-- }}}

-- Color schemes {{{
map('n', '<leader>sl', ':lua set_light_theme()<CR>', { silent = true, noremap = true, desc = "Light scheme" })
map('n', '<leader>sd', ':lua set_dark_theme()<CR>', { silent = true, noremap = true, desc = "Dark scheme" })
-- }}}

-- Spell check {{{
map('n', 'zle', ':set spell spelllang=en_us<CR>', { silent = true, noremap = true, desc = "en_US" })
map('n', 'zld', ':set spell spelllang=de_de<CR>', { silent = true, noremap = true, desc = "de_DE" })
map('n', 'zln', ':set nospell<CR>', { silent = true, noremap = true, desc = "Spell check off" })

-- }}}

-- un-highlight search occurrences {{{
map('n', '<leader>H', '<Cmd>noh<CR>', { silent = true, noremap = true, desc = "Search highlight off" })
-- }}}

-- Nvim Tree {{{
map('n', '<leader>e', ':NvimTreeFocus<CR>', { silent = true, noremap = true, desc = "Nvim Tree focus" })
map('n', '<leader>E', ':NvimTreeClose<CR>', { silent = true, noremap = true, desc = "Nvim Tree close" })
-- }}}

-- nnn file browser {{{
map('n', '<leader>fp', ':NnnPicker<CR>', { silent = true, noremap = true, desc = "File picker" })
map('n', '<leader>fe', ':NnnExplorer<CR>', { silent = true, noremap = true, desc = "File explorer" })
-- }}}

-- window navigation {{{
map('n', '<C-h>', '<C-w>h', { noremap = true, desc = "Window switch left" })
map('n', '<C-l>', '<C-w>l', { noremap = true, desc = "Window switch right" })
map('n', '<C-j>', '<C-w>j', { noremap = true, desc = "Window switch down" })
map('n', '<C-k>', '<C-w>k', { noremap = true, desc = "Window switch up" })
-- }}}

-- buffer navigation {{{
map('i', '<C-h>', '<Left>', { noremap = true, desc = "Cursor left" })
map('i', '<C-l>', '<Right>', { noremap = true, desc = "Cursor right" })
map('i', '<C-j>', '<Down>', { noremap = true, desc = "Cursor down" })
map('i', '<C-k>', '<Up>', { noremap = true, desc = "Cursor up" })

set({'n', 'i'}, '<A-k>', '<C-y>', { noremap = true, desc = "Scroll up" })
set({'n', 'i'}, '<A-j>', '<C-e>', { noremap = true, desc = "Scroll down" })
-- }}}

-- move lines {{{
-- see https://vim.fandom.com/wiki/Moving_lines_up_or_down
set({'n'}, '<C-A-k>', ':m .-2<CR>==', { noremap = true, desc = "Move line up" })
set({'n'}, '<C-A-j>', ':m .+1<CR>==', { noremap = true, desc = "Move line down" })
set({'i'}, '<C-A-k>', '<ESC>:m .-2<CR>==gi', { noremap = true, desc = "Move line up" })
set({'i'}, '<C-A-j>', '<ESC>:m .+1<CR>==gi', { noremap = true, desc = "Move line down" })
set({'v'}, '<C-A-k>', ":m '<-2<CR>gv=gv", { noremap = true, desc = "Move line up" })
set({'v'}, '<C-A-j>', ":m '>+1<CR>gv=gv", { noremap = true, desc = "Move line down" })
-- }}}

-- line numbers {{{
map('n', '<leader>nn', ':set nu!<CR>', { silent = true, noremap = true, desc = "Toggle line numbers" })
map('n', '<leader>nr', ':set rnu!<CR>', { silent = true, noremap = true, desc = "Toggle relative line numbers" })
-- }}}

-- Float term {{{
map('n', '<A-i>', ':lua require("FTerm").toggle()<CR>', { silent = true, noremap = true, desc = "Toggle float term" })
map('t', '<A-i>', '<C-\\><C-n>:lua require("FTerm").toggle()<CR>', { silent = true, noremap = true, desc = "Toggle float term" }) -- see https://www.reddit.com/r/neovim/comments/cger8p/how_quickly_close_a_terminal_buffer/
-- }}}

-- startify {{{
map('n', '<leader>^', ':Startify<CR>', { silent = true, noremap = true, desc = "Startify" }) 
-- }}}

-- fugitive {{{
map('n', '<leader>gg', '<Cmd>Git<CR>', { silent = true, noremap = true, desc = "Git tool" })
map('n', '<leader>gmc', '<Cmd>Gvdiffsplit!<CR>', { silent = true, noremap = true, desc = "Git merge diff" })
map('n', '<leader>gmh', '<Cmd>diffget //2<CR>', { silent = true, noremap = true, desc = "Git merge left (head)" })
map('n', '<leader>gml', '<Cmd>diffget //3<CR>', { silent = true, noremap = true, desc = "Git merge right (branch)" })
-- }}}

-- GitSigns {{{
map('n', '<leader>ga', '<Cmd>Gitsigns toggle_current_line_blame<CR>', { silent = true, noremap = true, desc = "Git toggle annotations" })
-- }}}

-- LSP float documentation {{{
-- set('n', 'K', show_documentation, { silent = true }) -- obsolete with vim.lsp.buf.hover
-- }}}

-- LSP {{{
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
set('n', '<leader>d', vim.diagnostic.open_float, {desc = "Preview diagnostics"})
set('n', '<leader>g[', vim.diagnostic.goto_prev, {desc = "Go to prev diagnostics"})
set('n', '<leader>g]', vim.diagnostic.goto_next, {desc = "Go to next diagnostics"})
set('n', '<leader>od', vim.diagnostic.setqflist, {desc = "Open diagnostics list"})
set('n', '<leader>oD', vim.diagnostic.setloclist, {desc = "Open current buffer diagnostics list"})
set('n', '<leader>D', '<CMD>LspDiagnosticsToggleVirtualText<CR>', {desc = "Toggle Diagnostics float window"})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        local lsp_opts = {buffer = ev.buf }

        lsp_opts["desc"] = "Go to declaration"
        set('n', 'gD', vim.lsp.buf.declaration, lsp_opts)

        lsp_opts["desc"] = "Go to definition"
        set('n', 'gd', vim.lsp.buf.definition, lsp_opts)

        lsp_opts["desc"] = "Go to implementation"
        set('n', 'gi', vim.lsp.buf.implementation, lsp_opts)

        lsp_opts["desc"] = "List references"
        set('n', 'gr', vim.lsp.buf.references, lsp_opts)

        lsp_opts["desc"] = "Go to type definition"
        set('n', 'gt', vim.lsp.buf.type_definition, lsp_opts)

        lsp_opts["desc"] = "Show documentation"
        set('n', 'ö', vim.lsp.buf.hover, lsp_opts)

        lsp_opts["desc"] = "Show signature"
        set({'n', 'i'}, '<C-ö>', vim.lsp.buf.signature_help, lsp_opts)

        lsp_opts["desc"] = "Peek definition"
        set('n', '<leader>i', "<CMD>lua require('goto-preview').goto_preview_definition()<CR>", lsp_opts)

        lsp_opts["desc"] = "Peek type definition"
        set('n', '<leader>I', "<CMD>lua require('goto-preview').goto_preview_type_definition()<CR>", lsp_opts)

        lsp_opts["desc"] = "Close peek window"
        set('n', '<leader>k', "<CMD>lua close_peek_definition()<CR>", lsp_opts)

        lsp_opts["desc"] = "Close all peek windows"
        set('n', '<leader>K', "<CMD>lua require('goto-preview').close_all_win()<CR>", lsp_opts)

        lsp_opts["desc"] = "Add workspace folder"
        set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, lsp_opts)

        lsp_opts["desc"] = "Remove workspace folder"
        set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, lsp_opts)

        lsp_opts["desc"] = "List workspace folder"
        set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, lsp_opts)

        lsp_opts["desc"] = "Lsp Rename"
        set('n', '<A-r>', vim.lsp.buf.rename, lsp_opts)

        lsp_opts["desc"] = "List code actions"
        set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, lsp_opts)

        lsp_opts["desc"] = "Format code"
        set('n', '<leader>lf', function()
            vim.lsp.buf.format { async = true }
        end, lsp_opts)
    end,
})
-- }}}

-- Rust {{{
set('n', '<leader>rm', '<CMD>RustLsp expandMacro<CR>', { desc = "Expand macro" })
set('n', '<leader>rr', '<CMD>RustLsp run<CR>', { desc = "Run" })
set('n', '<leader>rR', '<CMD>RustLsp runnabels<CR>', { desc = "List runnabels" })
set('n', '<leader>rd', '<CMD>RustLsp debug<CR>', { desc = "Debug" })
set('n', '<leader>rD', '<CMD>RustLsp debuggables<CR>', { desc = "List debuggabels" })

-- see plugin-configs/lsp-rust for more key bindings 
-- }}}

-- crates {{{
local crates = require("crates")

set("n", "<leader>rct", crates.toggle, { silent = true, desc = "Toggle annotations"})

set("n", "<leader>rcr", crates.reload, { silent = true, desc = "Reload" })

set("n", "<leader>rcv", crates.show_versions_popup, { silent = true, desc = "Preview version" })
set("n", "<leader>rcf", crates.show_features_popup, { silent = true, desc = "Preview features" })
set("n", "<leader>rcd", crates.show_dependencies_popup, { silent = true, desc = "Preview dependecies" })

set("n", "<leader>rcu", crates.update_crate, { silent = true, desc = "Update crate" })
set("v", "<leader>rcu", crates.update_crates, { silent = true, desc = "Update crates" })
set("n", "<leader>rca", crates.update_all_crates, { silent = true, desc = "Update all crates" })
set("n", "<leader>rcU", crates.upgrade_crate, { silent = true, desc = "Upgrade crate" })
set("v", "<leader>rcU", crates.upgrade_crates, { silent = true, desc = "Upgrade crates" })
set("n", "<leader>rcA", crates.upgrade_all_crates, { silent = true, desc = "Upgrade all crates" })

set("n", "<leader>rcx", crates.expand_plain_crate_to_inline_table, { silent = true, desc = "Expand to inline table" })
set("n", "<leader>rcX", crates.extract_crate_into_table, { silent = true, desc = "Extract into table" })

set("n", "<leader>rcH", crates.open_homepage, { silent = true, desc = "Open homepage" })
set("n", "<leader>rcR", crates.open_repository, { silent = true, desc = "Open repository" })
set("n", "<leader>rcD", crates.open_documentation, { silent = true, desc = "Open documentation" })
set("n", "<leader>rcC", crates.open_crates_io, { silent = true, desc = "Open crates.io" })
-- }}}

-- Comment {{{
set('n', '<leader>/', function()
        require("Comment.api").toggle.linewise.current()
      end,
      { desc = "Toggle comment" }
)
set('v', '<leader>/', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "Toggle comment" })
set('n', '<C-7>', function()
        require("Comment.api").toggle.linewise.current()
        vim.cmd('execute "norm j"')
      end,
      { desc = "Toggle comment" }
)
-- }}}

-- Telescope {{{
map('n', '<leader>ff', ':Telescope find_files<CR>', { silent = true, noremap = true, desc = "Find files"})
map('n', '<leader>fa', ':Telescope find_files follow=true no_ignore=true hidden=true<CR>', { silent = true, noremap = true, desc = "Find hidden files"})
map('n', '<leader>fw', ':Telescope live_grep<CR>', { silent = true, noremap = true, desc = "Grep"})
map('n', '<leader>fb', ':Telescope buffers<CR>', { silent = true, noremap = true, desc = "Find buffer"})
map('n', '<leader>fh', ':Telescope help_tags<CR>', { silent = true, noremap = true, desc = "Find help tags"})
map('n', '<leader>fo', ':Telescope oldfiles<CR>', { silent = true, noremap = true, desc = "find old files"})
map('n', '<leader>fz', ':Telescope current_buffer_fuzzy_find<CR>', { silent = true, noremap = true, desc = "Find fuzzy in buffer"})
map('n', '<leader>fl', ':Telescope spell_suggest<CR>', { silent = true, noremap = true, desc = "Find spelling"})
-- map('n', '<leader>fp', ':Telescope terms<CR>', { silent = true, noremap = true})
map('n', '<leader>fm', ':Telescope marks<CR>', { silent = true, noremap = true, desc = "Find marks"})
map('n', '<leader>fr', ':Telescope registers<CR>', { silent = true, noremap = true, desc = "Find registers"})
map('n', '<leader>fs', ':Telescope search_history<CR>', { silent = true, noremap = true, desc = "Find search history"})
map('n', '<leader>fk', ':Telescope keymaps<CR>', { silent = true, noremap = true, desc = "Find keymaps"})
map('n', '<leader>ft', ':TodoTelescope<CR>', { silent = true, noremap = true, desc = "Find todos"})

map('n', '<leader>gc', ':Telescope git_commits<CR>', { silent = true, noremap = true, desc = "Git commits"})
map('n', '<leader>gs', ':Telescope git_status<CR>', { silent = true, noremap = true, desc = "Git status"})
map('n', '<leader>gb', ':Telescope git_branches<CR>', { silent = true, noremap = true, desc = "Git branches"})

map('n', '<leader>tp', ':Telescope diagnostics<CR>', { silent = true, noremap = true, desc = "Diagonstics"})
map('n', '<leader>td', ':Telescope lsp_definitions<CR>', { silent = true, noremap = true, desc = "Definitions"})
map('n', '<leader>ts', ':Telescope lsp_document_symbols<CR>', { silent = true, noremap = true, desc = "Document symbols"})
map('n', '<leader>tS', ':Telescope lsp_document_symbols ignore_symbols=variable<CR>', { silent = true, noremap = true, desc = "Document symbols (no vars)"})
map('n', '<leader>tw', ':Telescope lsp_workspace_symbols<CR>', { silent = true, noremap = true, desc = "Workspace symbols"})
map('n', '<leader>tW', ':Telescope lsp_dynamic_workspace_symbols<CR>', { silent = true, noremap = true, desc = "Dynamic workspace symbols"})
map('n', '<leader>tm', ':Telescope lsp_implementations<CR>', { silent = true, noremap = true, desc = "Implementations"})
map('n', '<leader>ti', ':Telescope lsp_incoming_calls<CR>', { silent = true, noremap = true, desc = "Incoming calls"})
map('n', '<leader>to', ':Telescope lsp_outgoing_calls<CR>', { silent = true, noremap = true, desc = "Outgoing calls"})
map('n', '<leader>tr', ':Telescope lsp_references<CR>', { silent = true, noremap = true, desc = "References"})
map('n', '<leader>tt', ':Telescope lsp_dynamic_workspace_symbols<CR>', { silent = true, noremap = true, desc = "Dynamic workspace symbols"})
map('n', '<leader>tT', ':Telescope lsp_type_definitions<CR>', { silent = true, noremap = true, desc = "Type definitions"})
-- }}}

-- Markdown preview {{{
map('n', '<leader>mp', ':MarkdownPreview<CR>', { silent = true, noremap = true, desc = "Preview open"})
map('n', '<leader>ms', ':MarkdownPreviewStop<CR>', { silent = true, noremap = true, desc = "Preview stop"})
map('n', '<leader>mt', ':MarkdownPreviewToggle<CR>', { silent = true, noremap = true, desc = "Preview toggle"})
-- }}}

-- dap {{{
map('n', '<leader>db', ':DapToggleBreakpoint<CR>', { silent = true, noremap = true, desc = "Toggle breakpoint"})
set('n', '<Leader>dB', function() require('dap').set_breakpoint() end, { silent = true, noremap = true, desc = "Set breakpoint"})
set('n', '<Leader>dl', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { silent = true, noremap = true, desc = "Set logpoint"})
map('n', '<f5>', ':DapContinue<CR>', { silent = true, noremap = true, desc = "Debug continue"})
map('n', '<f6>', ':DapTerminate<CR>', { silent = true, noremap = true, desc = "Debug stop"})
map('n', '<f7>', ':DapStepInto<CR>', { silent = true, noremap = true, desc = "Debug step into"})
map('n', '<f8>', ':DapStepOut<CR>', { silent = true, noremap = true, desc = "Debug step out"})
map('n', '<f9>', ':DapStepOver<CR>', { silent = true, noremap = true, desc = "Debug step over"})
map('n', '<f10>', ':DapPlayPause<CR>', { silent = true, noremap = true, desc = "Debug play/pause"})
map('n', '<leader>dr', ':DapToggleRepl<CR>', { silent = true, noremap = true, desc = "Toggle REPL"})
map('n', '<leader>dF', ':DapUiFloat<CR>', { silent = true, noremap = true, desc = "UI float"})
map('n', '<leader>du', ':DapUiToggle<CR>', { silent = true, noremap = true, desc = "UI toggle"})
set('n', '<Leader>dd', function() require('dap').run_last() end, { silent = true, noremap = true, desc = "Run last"})
set('n', '<leader>dw', function ()
            local widgets = require('dap.ui.widgets');
            local sidebar = widgets.sidebar(widgets.scopes);
            sidebar.open();
        end,
        { silent = true, noremap = true, desc = "Widgets sidebar"}
    )
set({'n', 'v'}, '<Leader>dh', function()
      require('dap.ui.widgets').hover()
    end,
    { silent = true, noremap = true, desc = "Widgets hover"}
)
set({'n', 'v'}, '<Leader>dp', function()
      require('dap.ui.widgets').preview()
    end,
    { silent = true, noremap = true, desc = "Widgets preview"}
)
set('n', '<Leader>df', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.frames)
    end,
    { silent = true, noremap = true, desc = "Widgets frames"}
)
set('n', '<Leader>ds', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.scopes)
    end,
    { silent = true, noremap = true, desc = "Widgets scopes"}
)
-- }}}

-- Dadbod DB Client {{{
map('n', '<leader>pu', ':DBUIToggle<CR>', { silent = true, noremap = true, desc = "DB UI toggle"})
map('n', '<leader>pf', ':DBUIFindBuffer<CR>', { silent = true, noremap = true, desc = "DB find buffer"})
map('v', '<leader>pe', ':DB<CR>', { silent = true, noremap = true, desc = "DB execute"})
-- }}}

-- barbar (tabs) {{{
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', { silent = true, noremap = true, desc = "Previous tab" })
map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', { silent = true, noremap = true, desc = "Previous tab" })
map('n', '<A-.>', '<Cmd>BufferNext<CR>', { silent = true, noremap = true, desc = "Next tab" })
map('n', '<Tab>', '<Cmd>BufferNext<CR>', { silent = true, noremap = true, desc = "Next tab" })
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', { silent = true, noremap = true, desc = "Move tab left" })
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', { silent = true, noremap = true, desc = "Move tab right" })
-- map('n', '<A-p>', '<Cmd>BufferPin<CR>', { silent = true, noremap = true })
map('n', '<A-c>', '<Cmd>BufferClose<CR>', { silent = true, noremap = true, desc = "Tab close" })
map('n', '<A-o>', '<Cmd>BufferCloseAllButCurrent<CR>', { silent = true, noremap = true, desc = "Tab close all but current" })
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<A-p>', '<Cmd>BufferPick<CR>', { silent = true, noremap = true, desc = "Tab select" })
-- }}}

-- Todo Comment {{{
map('n', '<leader>ot', ':TodoQuickFix<CR>', { silent = true, noremap = true, desc = "List todos"})
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
--
-- neotest {{{
map('n', '<leader>rtr', '<Cmd>lua require("neotest").run.run()<CR>', { silent = true, noremap = true, desc = "Run nearest test" })
map('n', '<leader>rts', '<Cmd>Neotest summary<CR>', { silent = true, noremap = true, desc = "Show summary" })
map('n', '<leader>rto', '<Cmd>Neotest output<CR>', { silent = true, noremap = true, desc = "Show output" })
map('n', '<leader>rtp', '<Cmd>Neotest output_panel<CR>', { silent = true, noremap = true, desc = "Show output panel" })
map('n', '<leader>rtw', '<Cmd>Neotest watch<CR>', { silent = true, noremap = true, desc = "Watch tests" })
-- map('n', '<leader>rtd', '<Cmd>Neotest diagnostic<CR>', { silent = true, noremap = true, desc = "Show diagnostics" })
-- map('n', '<leader>rti', '<Cmd>Neotest status<CR>', { silent = true, noremap = true, desc = "Show status signs" })
-- }}}
