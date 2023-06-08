-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}}

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	}

--	use {
--		'tanvirtin/monokai.nvim',
--		config = function()
--			require('monokai').setup()
--		end
--	}
    
    use 'nordtheme/vim'

    use {
        'm4xshen/autoclose.nvim',
        config = function ()
            require('autoclose').setup()
        end
    }

	use {
		'kylechui/nvim-surround',
		tag = '*',
		config = function()
			require('nvim-surround').setup()
		end
	}

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		"akinsho/toggleterm.nvim", tag = '*',
		config = function()
			require("toggleterm").setup()
		end
	}

	use 'tpope/vim-fugitive'
	use 'mbbill/undotree'

    use "folke/which-key.nvim"

    use 'lervag/vimtex'
end)
