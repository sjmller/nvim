-- Ensure packer is installed
local install_path = vim.fn.stdpath('data') ..
                         '/site/pack/packer/start/packer.nvim'
local ensure_packer = function()
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.system({
            'git', 'clone', '--depth', '1',
            'https://github.com/wbthomason/packer.nvim', install_path
        })
        vim.cmd [[packadd packer.nvim]]
        return true
    else
        return false
    end
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({
    function(use)
        use {'wbthomason/packer.nvim', config = ""}

        -- look and feel
        use {
            'EdenEast/nightfox.nvim',
            config = "require('config.nightfox-config')"
        }
        use {
            'glepnir/dashboard-nvim',
            config = "require('config.dashboard-config')"
        }
        use "kyazdani42/nvim-web-devicons"
        use "onsails/lspkind.nvim"

        -- common utils
        use 'nvim-lua/plenary.nvim'
        use 'dstein64/vim-startuptime'

        -- file organization and fuzzy finding
        use {
            'nvim-tree/nvim-tree.lua',
            cmd = "NvimTreeToggle",
            config = "require('config.nvim-tree-config')"
        }
        use {
            'nvim-telescope/telescope.nvim',
            branch = '0.1.x',
            config = "require('config.telescope-config')"
        }
        use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

        -- syntax highlighting, indenting, etc.
        use {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                require('nvim-treesitter.install').update({with_sync = true})
            end,
            event = "BufWinEnter",
            config = "require('config.treesitter-config')"
        }

        -- lsp functionality
        use {
            'neovim/nvim-lspconfig',
            config = "require('config.lspconfig-config')",
            after = "cmp-nvim-lsp"
        }
        use {
            'glepnir/lspsaga.nvim',
            config = "require('config.lspsaga-config')",
            after = "nvim-lspconfig"
        }

        -- automatic server instalation
        use {
            "williamboman/mason.nvim",
            config = "require('config.mason-config')",
            after = "nvim-lspconfig"
        }

        -- completion
        use {
            "hrsh7th/nvim-cmp",
            config = "require('config.cmp-config')",
            event = "InsertEnter"
        }
        use {"hrsh7th/cmp-nvim-lsp", after = "nvim-cmp"}
        use {'hrsh7th/cmp-buffer', after = "nvim-cmp"}
        use {'hrsh7th/cmp-path', after = "nvim-cmp"}
        use 'rafamadriz/friendly-snippets'
        use {
            "L3MON4D3/LuaSnip",
            config = "require('config.luasnip-config')",
            after = "nvim-cmp"
        }
        use {'saadparwaiz1/cmp_luasnip', after = "nvim-cmp"}

        -- null-ls
        use {
            "jose-elias-alvarez/null-ls.nvim",
            after = "nvim-lspconfig",
            config = "require('config.null-ls-config')"
        }

        if packer_bootstrap then -- sync in case packer was not installed yet
            require('packer').sync()
        end
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({border = "single"})
            end
        }
    }
})
