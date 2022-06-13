-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Style
  use 'gruvbox-community/gruvbox'
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- File find
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-project.nvim'

  -- LSP
  use 'williamboman/nvim-lsp-installer'
  use 'neovim/nvim-lspconfig'
  use 'nvim-treesitter/nvim-treesitter'
  use 'hrsh7th/nvim-cmp'
  use "hrsh7th/cmp-nvim-lsp"

  -- NERDTree
  use 'preservim/nerdtree'
  use 'tiagofumo/vim-nerdtree-syntax-highlight'
  use 'ryanoasis/vim-devicons'

  -- Navigation
  use 'ThePrimeagen/harpoon'

  -- Floatterm
  use 'voldikss/vim-floaterm'

  -- Git
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'shumphrey/fugitive-gitlab.vim'
  use 'airblade/vim-gitgutter'

  use 'tpope/vim-eunuch'             -- Shell commands
  use 'tpope/vim-commentary'         -- Comments
  use 'tpope/vim-surround'           -- Surround words***
  use 'vim-utils/vim-man'            -- Manual
  use 'vimwiki/vimwiki'              -- Notes
  use 'tomtom/tlib_vim'              -- Utility functions, dependancy
  use 'MarcWeber/vim-addon-mw-utils' -- Dependancy?
  use 'wellle/targets.vim'           -- Extended targets***, like "ci"
end)
