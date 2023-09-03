-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Style
    use 'nvim-tree/nvim-web-devicons'
    use 'gruvbox-community/gruvbox'
    use 'ayu-theme/ayu-vim'
    use 'altercation/vim-colors-solarized'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- File find
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-project.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

    -- LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "jose-elias-alvarez/null-ls.nvim"
    }
    use 'nvim-treesitter/nvim-treesitter'
    use 'hrsh7th/nvim-cmp'
    use "hrsh7th/cmp-nvim-lsp"
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-cmdline"

    -- Diagnostics
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                icons = true,
                use_diagnostic_signs = true,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- Tree
    use {
         'nvim-tree/nvim-tree.lua',
          requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
          },
          tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- Navigation
    use 'ThePrimeagen/harpoon'
    use {
        "akinsho/toggleterm.nvim",
        tag = '*',
        config = function()
          require("toggleterm").setup()
        end
    }

    -- Git
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'shumphrey/fugitive-gitlab.vim'

    use "sheerun/vim-polyglot" -- Indentation
    use 'tpope/vim-eunuch' -- Shell commands
    use 'tpope/vim-commentary' -- Comments
    use 'tpope/vim-surround' -- Surround words***
    use 'vim-utils/vim-man' -- Manual
    use 'vimwiki/vimwiki' -- Notes
    use 'tomtom/tlib_vim' -- Utility functions, dependancy
    use 'MarcWeber/vim-addon-mw-utils' -- Dependancy?
    use 'wellle/targets.vim' -- Extended targets***, like "ci"
    use 'folke/zen-mode.nvim' -- Zen mode
    use("eandrju/cellular-automaton.nvim") -- Flambouyant animations

end)