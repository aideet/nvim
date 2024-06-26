local options = {
    ensure_installed = { "lua", "rust", "go", "yaml", "xml", "markdown", "json", "http", "graphql", "gitcommit", "gitignore", "vim", "vimdoc" },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },

    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
}

-- folding see https://github.com/nvim-treesitter/nvim-treesitter#folding

return options

