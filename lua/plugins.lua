-- vim: foldmethod=marker
return {
    "nvim-tree/nvim-web-devicons",
    "tpope/vim-surround",
    "numToStr/FTerm.nvim",
    -- "mcchrish/nnn.vim",
    'nvim-lua/plenary.nvim',
-- luukvbaal/nnn.nvim {{{
    {
        "luukvbaal/nnn.nvim",
        lazy = false,
        opts = function()
            return require "plugin-configs.nnn"
        end,
        config = function(_, opts)
            require("nnn").setup(opts)
        end,
    },
-- }}}
-- norcalli/nvim-colorizer.lua {{{
    {
        "norcalli/nvim-colorizer.lua",
        lazy = false,
        config = function()
            require("colorizer").setup()
        end,
    },
-- }}}
-- folke/which-key.nvim {{{
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
-- }}}
-- theme catppuccin {{{
    { 
        "catppuccin/nvim", 
        name = "catppuccin", 
        priority = 1000,
    },
-- }}}
-- theme nightfox {{
    {
      "EdenEast/nightfox.nvim",
      priority = 1000, -- Ensure it loads first
    },
-- }}}
-- theme tokyonight {{
    {
      "folke/tokyonight.nvim",
      priority = 1000, -- Ensure it loads first
    },
-- }}}
-- theme vscode {{
    {
      "Mofiqul/vscode.nvim",
      priority = 1000, -- Ensure it loads first
    },
-- }}}
-- theme onedarkpro{{{
    {
      "olimorris/onedarkpro.nvim",
      priority = 1000, -- Ensure it loads first
    },
-- }}}
-- stevearc/dressing.nvim{{{
{
  'stevearc/dressing.nvim',
  opts = {},
},
-- }}}
-- kevinhwang91/nvim-ufo {{{
    {
        "kevinhwang91/nvim-ufo",
        lazy = false,
        dependencies = {
            "kevinhwang91/promise-async",
        },
        config = function()
            require "plugin-configs.nvim-ufo"
        end,
    },
-- }}}
-- nvim-tree/nvim-tree.lua {{{
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
-- }}}
-- nvim-lualine/lualine.nvim {{{
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
-- }}}
-- ukas-reineke/indent-blankline.nvim {{{
    { 
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        config = function()
            require("ibl").setup()
        end,
    },
-- }}}
-- nvim-treesitter/nvim-treesitter {{{
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
-- }}}
-- tpope/vim-fugitive {{{
    {
        "tpope/vim-fugitive",
        lazy = false,
    },
-- }}}
-- wintermute-cell/gitignore.nvim {{{
    {"wintermute-cell/gitignore.nvim",
    config = function()
        require('gitignore')
    end,
    },
-- }}}
-- mfussenegger/nvim-lint {{{
    {
        "mfussenegger/nvim-lint",
        lazy = false,
        config = function()
            require "plugin-configs.nvim-lint"
        end,
    },
-- }}}
-- junegunn/gv.vim {{{
    { 
        "junegunn/gv.vim",
        dependencies = { "tpope/vim-fugitive" },
        lazy = false,
    },
-- }}}
-- lewis6991/gitsigns.nvim {{{
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
-- }}}
-- mhinz/vim-startify {{{
    {
        'mhinz/vim-startify',
        lazy = false,
        config = function(_, opts)
            require("plugin-configs.startify")
        end,
    },
-- }}}
-- williamboman/mason.nvim {{{
    {
        "williamboman/mason.nvim",
        opts = function()
            return require "plugin-configs.mason"
        end,
        config = function(_, opts)
            require("mason").setup(opts)
        end,
    },
-- }}}
-- neovim/nvim-lspconfig {{{
    {
        "neovim/nvim-lspconfig",
    },
-- }}}
-- towolf/vim-helm {{{
 { 'towolf/vim-helm',       ft = 'helm' },
-- }}}
-- jglasovic/venv-lsp {{{
 { 'jglasovic/venv-lsp.nvim' },
-- }}}
-- lsp progress {{{
    {
      'linrongbin16/lsp-progress.nvim',
      opts = function ()
          return require "plugin-configs.lsp_progress"
      end,
      config = function (_, opts) 
        require('lsp-progress').setup(opts)
      end,
    },
-- }}}
-- rmagatti/goto-preview {{{
{
  'rmagatti/goto-preview',
  config = function()
    require('goto-preview').setup {}
  end
},
-- }}}
-- mrcjkb/rustaceanvim {{{
    {
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        -- ft = { 'rust' },
        lazy = false,
        config = function ()
            return require "plugin-configs.lsp-rust"
        end,
    },
-- }}}
-- neotest {{{
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        },
        config = function ()
            return require('neotest').setup {
                adapters = {
                    require('rustaceanvim.neotest')
                },
            }
        end,
    },
-- }}}
-- saecki/crates.nvim {{{
    {
        'saecki/crates.nvim',
        tag = 'stable',
        config = function()
            require("plugin-configs.crates")
        end,
    },
-- }}}
-- ray-x/go.nvim {{{
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
-- }}}
-- hrsh7th/nvim-cmp {{{
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
-- }}}
   'mfussenegger/nvim-dap',
-- rcarriga/nvim-dap-ui {{{
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { { "mfussenegger/nvim-dap" } },
        ft = {"go", "rust", "py"},
        config = function()
           require("dapui").setup({})
        end
    },
-- }}}
-- mfussenegger/nvim-dap-python{{{
    {
        "mfussenegger/nvim-dap-python",
        ft = {"py"},
        config = function()
            require("dap-python").setup("python")
        end
    },
-- }}}
-- leoluz/nvim-dap-go {{{
    {
        "leoluz/nvim-dap-go",
        ft = {"go"},
        config = function()
           require("dap-go").setup()
        end
    },
-- }}}
-- numToStr/Comment.nvim {{{
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
-- }}}
-- nvim-telescope/telescope.nvim {{{
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
-- }}}
-- iamcco/markdown-preview.nvim {{{
    {
        "iamcco/markdown-preview.nvim",
        ft = {"markdown"},
        build = function() vim.fn["mkdp#util#install"]() end,
    },
-- }}}
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
-- kristijanhusak/vim-dadbod-ui {{{
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
-- }}}
-- romgrk/barbar.nvim {{{
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
-- }}}
-- Bekaboo/dropbar.nvim {{{
{
    'Bekaboo/dropbar.nvim',
    -- optional, but required for fuzzy finder support
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim'
    }
},
-- }}}
-- smoka7/hop.nvim {{{
{
    'smoka7/hop.nvim',
    version = "*",
    opts = {
        keys = 'etovxqpdygfblzhckisuran'
    }
},
-- }}}
-- folke/todo-comments.nvim {{{
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = function ()
            return require "plugin-configs.todo-comments"
        end,
        -- config = function (_, opts) 
        --   require("nvim-treesitter.configs").setup(opts)
        -- end,
    },
-- }}}
-- vhyrro/luarocks.nvim {{{
    {
      "vhyrro/luarocks.nvim",
      priority = 1000,
      config = true,
      opts = {
        rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
      }
    },
    -- }}}
    -- rest-nvim/rest.nvim {{{
    {
      "rest-nvim/rest.nvim",
      ft = "http",
      dependencies = { "luarocks.nvim" },
      opts = function ()
          return require "plugin-configs.rest"
      end,
      config = function(_, opts)
        require("rest-nvim").setup(opts)
      end,
    }
-- }}}
}
