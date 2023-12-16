return {
    "nvim-tree/nvim-web-devicons",
    { 
        "catppuccin/nvim", 
        name = "catppuccin", 
        priority = 1000 
    },
	"folke/which-key.nvim",
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = function()
            return require "plugin-configs.nvim-tree"
        end,
        config = function()
            require("nvim-tree").setup {opts}
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            return require "plugin-configs.lualine"
        end,
    }

}
