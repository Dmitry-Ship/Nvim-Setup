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
  use {
    'navarasu/onedark.nvim',
    config = function()
      require('dmitry.plugins.colorscheme')
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('dmitry.plugins.lualine')
    end
  }
  use {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('dmitry.plugins.tree')
    end
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require('dmitry.plugins.telescope')
    end
  }
  use {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup({ default = true; })
    end
  }

  -- конфиги для LSP серверов, нужен для простой настройки и
  -- возможности добавления новых серверов
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('dmitry.plugins.lsp')
    end
  }
  -- зависимости для движка автодополнения
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'

  -- движок автодополнения для LSP
  use 'hrsh7th/nvim-cmp'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('dmitry.plugins.treesitter') 
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
