
require('lint').linters_by_ft = {
  yaml = {'yamllint',},
  sh = {'dotenv_linter',},
  json = {'jsonlint',},
  html = {'tidy',},
} 

local dotenv_linter = require('lint').linters.dotenv_linter
dotenv_linter.args = {
    '--quiet',
    '--no-color',
    "--skip=UnorderedKey",
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
