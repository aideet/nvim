return {
    "nvim-tree/nvim-web-devicons",
	"folke/which-key.nvim",
    "tpope/vim-surround",
    "numToStr/FTerm.nvim",
    { 
        "catppuccin/nvim", 
        name = "catppuccin", 
        priority = 1000 
    },
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
            require("nvim-tree").setup(opts)
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
    },
    {
        "lewis6991/gitsigns.nvim",
        ft = { "gitcommit", "diff" },
        init = function()
          -- load gitsigns only when a git file is opened
          vim.api.nvim_create_autocmd({ "BufRead" }, {
            group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
            callback = function()
              vim.fn.system("git -C " .. '"' .. vim.fn.expand "%:p:h" .. '"' .. " rev-parse")
              if vim.v.shell_error == 0 then
                vim.api.nvim_del_augroup_by_name "GitSignsLazyLoad"
                vim.schedule(function()
                  require("lazy").load { plugins = { "gitsigns.nvim" } }
                end)
              end
            end,
          })
        end,
        opts = function()
          return require("plugin-configs.gitsigns")
        end,
        config = function(_, opts)
          require("gitsigns").setup(opts)
        end,
        
    }
}
