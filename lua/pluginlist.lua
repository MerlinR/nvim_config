return {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    {
        "loctvl842/monokai-pro.nvim",
        priority = 1000,
        config = function()
            require("monokai-pro").setup()
            vim.cmd("colorscheme monokai-pro-spectrum")
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "onedark",
                    component_separators = { left = '|', right = '|' },
                    section_separators = { left = ' ', right = ' ' },
                },
                sections = {
                    lualine_c = {
                        {
                            sections = {lualine_c = {require('auto-session.lib').current_session_name}},
                            'filename',
                            file_status = true, -- displays file status (readonly status, modified status)
                            path = 1
                        }
                    }
                }
            })
        end
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    'folke/neodev.nvim',
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
            'hrsh7th/cmp-nvim-lsp',
        },
    },
    "lewis6991/gitsigns.nvim",
    "sindrets/diffview.nvim",
    {
        'rmagatti/auto-session',
        config = function()
            require("auto-session").setup({
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
                auto_session_create_enabled = false,
                session_lens = {
                    buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
                    load_on_setup = false,
                    theme_conf = { border = true },
                    previewer = true,
                },
            })
        end
    }
}