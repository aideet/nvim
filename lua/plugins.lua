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
        config = function(_, opts)
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
            require "plugin-configs.lualine"
        end,
    },
    { 
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        config = function()
            require("ibl").setup()
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = function ()
            return require "plugin-configs.treesitter"
        end,
        config = function (_, opts) 
          require("nvim-treesitter.configs").setup(opts)
        end,
    }
}
