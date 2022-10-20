-- Ensure packer is installed
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local ensure_packer = function()
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  else
    return false
  end
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({ function(use)
  use 'wbthomason/packer.nvim'

  -- look and feel
  use 'EdenEast/nightfox.nvim'
  use 'glepnir/dashboard-nvim'
  use "kyazdani42/nvim-web-devicons"
  use "onsails/lspkind.nvim"

  -- common utils
  use 'nvim-lua/plenary.nvim'
  use 'dstein64/vim-startuptime'

  -- file organization and fuzzy finding
  use 'nvim-tree/nvim-tree.lua'
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- syntax highlighting, indenting, etc.
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require(
        'nvim-treesitter.install').update({ with_sync = true })
    end,
  }

  -- lsp functionality
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use "williamboman/mason.nvim" -- automatic server instalation

  -- completion
  use "hrsh7th/cmp-nvim-lsp"
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'rafamadriz/friendly-snippets'
  use "hrsh7th/nvim-cmp"
  use "L3MON4D3/LuaSnip"
  use 'saadparwaiz1/cmp_luasnip'

  if packer_bootstrap then -- sync in case packer was not installed yet
    require('packer').sync()
  end
end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end
    }
  } })
