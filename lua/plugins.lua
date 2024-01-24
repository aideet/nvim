return {
    "nvim-tree/nvim-web-devicons",
    "tpope/vim-surround",
    "numToStr/FTerm.nvim",
    {
        "norcalli/nvim-colorizer.lua",
        lazy = false,
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "folke/which-key.nvim",
        -- event = "VeryLazy",
        lazy = false,
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
        config = function(_, opts)
            require("which-key").setup(opts)
        end,
    },
    { 
        "catppuccin/nvim", 
        name = "catppuccin", 
        priority = 1000,
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
        "tpope/vim-fugitive",
        lazy = false,
    },
    { "junegunn/gv.vim",
        dependencies = { "tpope/vim-fugitive" },
        lazy = false,
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
        
    },
    {
        'mhinz/vim-startify',
        lazy = false,
        config = function(_, opts)
            require("plugin-configs.startify")
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = function()
            return require "plugin-configs.mason"
        end,
        config = function(_, opts)
            require("mason").setup(opts)
        end,
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "simrat39/rust-tools.nvim",
        dependencies = "neovim/nvim-lspconfig",
        opts = function ()
            return require "plugin-configs.lsp-rust"
        end,
        config = function (_, opts)
            require('rust-tools').setup(opts)
            require'rust-tools'.hover_actions.hover_actions()
        end
    },
    {
        "ray-x/go.nvim",
        dependencies = {  -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        event = {"CmdlineEnter"},
        ft = {"go", 'gomod'},
        build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
        opts = function ()
            return require "plugin-configs.lsp-go"
        end,
        config = function(_, opts)
            require("go").setup(opts)
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                -- snippet plugin
                "L3MON4D3/LuaSnip",
                dependencies = "rafamadriz/friendly-snippets",
                opts = function ()
                    return require("plugin-configs.luasnip").opts
                end,
                config = function(_, opts)
                    require("luasnip").setup(opts)
                    require("plugin-configs.luasnip").load_formats()
                end,
            },

            -- autopairing of (){}[] etc
            {
               "windwp/nvim-autopairs",
                opts = {
                    fast_wrap = {},
                    disable_filetype = { "TelescopePrompt", "vim" },
                },
                config = function(_, opts)
                    require("nvim-autopairs").setup(opts)

                    -- setup cmp for autopairs
                    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
                    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
                end,
            },

            -- cmp sources plugins
            {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                -- "hrsh7th/cmp-cmdline",
                "hrsh7th/cmp-emoji",
            },
        },
        opts = function()
            return require "plugin-configs.cmp"
        end,
        config = function(_, opts)
            require("cmp").setup(opts)
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { { "mfussenegger/nvim-dap" } },
        ft = {"go", "rust"},
        config = function()
           require("dapui").setup({})
        end
    },
    {
        "leoluz/nvim-dap-go",
        ft = {"go"},
        config = function()
           require("dap-go").setup()
        end
    },
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },

    {
        "nvim-telescope/telescope.nvim",
        branch = '0.1.x',
        dependencies = {
                "nvim-treesitter/nvim-treesitter",
                "nvim-lua/plenary.nvim",
            },
        opts = function()
            return require "plugin-configs.telescope"
        end,
        config = function(_, opts)
            local telescope = require "telescope"
            telescope.setup(opts)

            -- load extensions
            for _, ext in ipairs(opts.extensions_list) do
                telescope.load_extension(ext)
            end
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        lazy=false,
        -- cmd = {
        --     'MarkdownPreview',
        --     'MarkdownPreviewStop',
        --     'MarkdownPreviewToggle',
        -- },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = {
            { 'tpope/vim-dadbod', lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
          -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
          -- animation = true,
          -- insert_at_start = true,
          -- …etc.
        },
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },
}
