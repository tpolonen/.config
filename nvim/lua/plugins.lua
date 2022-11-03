local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- TODO: better to have just the plugin download/activation here and make separate
-- lua files for configuration/keybinds, so that everything related to a single
-- plugin is available in the same file

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use { "williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}

	use { 'ms-jpq/coq_nvim', branch = 'coq', commit = '84ec5faf2aaf49819e626f64dd94f4e71cf575bc' }
	use { 'ms-jpq/coq.artifacts', branch = 'artifacts', }
	use { 'ms-jpq/coq.thirdparty', branch = '3p', }

	use 'nvim-tree/nvim-web-devicons'

	use { "catppuccin/nvim", commit = 'c4f0f1a88304378cb76ac0a0c00a99f6d58f972f', }
	use 'MunifTanjim/nui.nvim'
	use 'rcarriga/nvim-notify'
	use({
		"Pocco81/true-zen.nvim",
		config = function()
			 require("true-zen").setup {
				-- your config goes here
				-- or just leave it empty :)
			 }
		end,
	})
	use "nvim-lua/plenary.nvim"
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	-- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
	use {'nvim-telescope/telescope-ui-select.nvim' }

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use {
	    'goolord/alpha-nvim',
	    requires = { 'kyazdani42/nvim-web-devicons' },
	    config = function ()
	        require'alpha'.setup(require'alpha.themes.startify'.config)
	    end
	}

	use { 'rmagatti/auto-session', }
	use {
		'rmagatti/session-lens',
		requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
		config = function()
			require('session-lens').setup({--[[your custom config--]]})
		end
	}

	use {
		'romgrk/barbar.nvim',
		requires = {'kyazdani42/nvim-web-devicons'}
	}

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end

	-- Start of plugin config
	require "cfg-auto-session"
	require "cfg-barbar"
	require "cfg-catppuccin"
	require "cfg-lualine"
	require "cfg-telescope"
end)


