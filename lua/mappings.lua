local map = vim.api.nvim_set_keymap

map('i', 'jk', '<Esc>', { noremap = true })

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


