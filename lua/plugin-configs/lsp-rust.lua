
local on_attach = function(_, bufnr) 
    require("plugin-configs.lspconfig").on_attach(_, bufnr)
    local rt = require("rust-tools")
    vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, {buffer = bufnr})
    vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
end

local capabilities = require("plugin-configs.lspconfig").capabilities

local options = {
  tools = {
    hover_actions = {
      auto_focus = true,      
    },
  },
  server = {
    on_attach = on_attach,
    capabilities = capabilities;
  },

}

return options
