
-- -- Neovide scaling
-- vim.g.neovide_scale_factor = 1.0
-- change_scale_factor = function(delta)
--   vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * (1 + delta)
-- end

-- 
function show_documentation()
    local filetype = vim.bo.filetype
    if vim.tbl_contains({ 'vim','help' }, filetype) then
        vim.cmd('h '..vim.fn.expand('<cword>'))
    elseif vim.tbl_contains({ 'man' }, filetype) then
        vim.cmd('Man '..vim.fn.expand('<cword>'))
    elseif vim.fn.expand('%:t') == 'Cargo.toml' and require('crates').popup_available() then
        require('crates').show_popup()
    else
        vim.lsp.buf.hover()
    end
end

-- close recent goto-preview floating window
function close_peek_definition()
    local win = vim.api.nvim_get_current_win()
    require("goto-preview.lib").close_if_is_goto_preview(win)
end

function set_dark_theme()
    vim.o.background = 'dark'
    vim.cmd.colorscheme "catppuccin-macchiato"
    vim.cmd('highlight Search guibg=DarkYellow guifg=Black')
    vim.cmd('highlight CurSearch guibg=Yellow guifg=Blue gui=bold')
    vim.cmd('highlight Visual gui=none cterm=none guibg=#494d65')
    vim.cmd('highlight GitSignsCurrentLineBlame guifg=Azure2 guibg=LightSkyBlue4')
    vim.cmd('highlight folded guibg=NONE')
end

function set_light_theme()
    vim.o.background = 'light'
    vim.cmd.colorscheme "dayfox"
    vim.cmd('highlight Search guibg=DarkYellow guifg=Black')
    vim.cmd('highlight CurSearch guibg=Yellow guifg=Blue gui=bold')
    -- vim.cmd('highlight Visual gui=none cterm=none guibg=#494d65')
    -- vim.cmd('highlight GitSignsCurrentLineBlame guifg=Azure2 guibg=LightSkyBlue4')
    vim.cmd('highlight CursorLine guibg=#e8dccf')
    vim.cmd('highlight folded guibg=NONE')
    vim.cmd('highlight UfoFoldedEllipses guibg=white')
    vim.cmd('highlight BufferCurrent guibg=#f6f2ee')
    vim.cmd('highlight BufferCurrentSign guibg=#f6f2ee')
end

-- -- LSP preview definition (see https://github.com/neovim/neovim/pull/12368)
-- local function preview_location_callback(_, result, method, _)
--   if result == nil or vim.tbl_isempty(result) then
--     vim.lsp.log.info(method, 'No location found')
--     return nil
--   end
--   if vim.tbl_islist(result) then
--     vim.lsp.util.preview_location(result[1])
--   else
--     vim.lsp.util.preview_location(result)
--   end
-- end
--
-- function peek_definition()
--     local params = vim.lsp.util.make_position_params()
--     return vim.lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
-- end

-- Command to toggle inline diagnostics
vim.api.nvim_create_user_command(
  'LspDiagnosticsToggleVirtualText',
  function()
    local current_value = vim.diagnostic.config().virtual_text
    if current_value then
      vim.diagnostic.config({virtual_text = false})
    else
      vim.diagnostic.config({virtual_text = true})
    end
  end,
  {}
)
