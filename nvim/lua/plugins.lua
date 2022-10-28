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

return require('packer').startup(function(use)

	use 'wbthomason/packer.nvim'
	use { "williamboman/mason.nvim",
    	"williamboman/mason-lspconfig.nvim",
    	"neovim/nvim-lspconfig",
	}

	use { 'ms-jpq/coq_nvim', branch = 'coq', commit = '84ec5faf2aaf49819e626f64dd94f4e71cf575bc' }
	use { 'ms-jpq/coq.artifacts', branch = 'artifacts', }
	use { 'ms-jpq/coq.thirdparty', branch = '3p', }

	use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
        require("catppuccin").setup {
            flavour = "mocha" -- mocha, macchiato, frappe, latte
        }
        vim.api.nvim_command "colorscheme catppuccin"
    end
	}

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

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

