return {
    -- the colorscheme should be available when starting Neovim
    -- {
        --   "folke/tokyonight.nvim",
        --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
        --   priority = 1000, -- make sure to load this before all the other start plugins
        --   config = function()
            --     -- load the colorscheme here
            --     vim.cmd([[colorscheme tokyonight]])
            --   end,
            -- },

            -- I have a separate config.mappings file where I require which-key.
            -- With lazy the plugin will be automatically loaded when it is required somewhere
            { "folke/which-key.nvim", lazy = true },


            {
                "dstein64/vim-startuptime",
                -- lazy-load on a command
                cmd = "StartupTime",
                -- init is called during startup. Configuration for vim plugins typically should be set in an init function
                init = function()
                    vim.g.startuptime_tries = 10
                end,
            },

            {
                "hrsh7th/nvim-cmp",
                -- load cmp on InsertEnter
                event = "InsertEnter",
                -- these dependencies will only be loaded when cmp loads
                -- dependencies are always lazy-loaded unless specified otherwise
                dependencies = {
                    "hrsh7th/cmp-nvim-lsp",
                    "hrsh7th/cmp-buffer",
                },
                config = function()
                    -- ...
                end,
            },

            {
                'ray-x/lsp_signature.nvim',
                config = function()
                    -- ...
                end,
            },

            {
                'sainnhe/gruvbox-material',
                lazy = false,
                priority = 1000,
                config = function()
                    -- Optionally configure and load the colorscheme
                    -- directly inside the plugin declaration.
                    vim.g.gruvbox_material_enable_italic = false
                    vim.g.gruvbox_material_background = 'soft'
                    vim.cmd.colorscheme('gruvbox-material')
                end
            },

            {
                "neovim/nvim-lspconfig",
                opts = {},
                config = function() 
                end
            },

            { "mason-org/mason.nvim", opts = {} },

            {
                "github/copilot.vim",
                opts = {},
                config = function()
                end
            },

            {
                "marchelzo/ty.vim",
                config = function()
                    vim.lsp.enable('tyd')
                end
            },

            { "tpope/vim-fugitive" },
        }
