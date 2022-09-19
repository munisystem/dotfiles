local no_errors, packer = pcall(require, "packer")
if (not no_errors) then
  print("Packer is not found, please install it. https://github.com/wbthomason/packer.nvim")
  return
end

vim.cmd [[packadd packer.nvim]]

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'navarasu/onedark.nvim'
  use 'nvim-lua/plenary.nvim'

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help' -- show function signatures duaring insertion.
  use 'onsails/lspkind-nvim' -- use VSCode like icons in lsp
  use 'L3MON4D3/LuaSnip' -- expand suggestion in nvim-cmp
  use 'williamboman/mason.nvim' -- lsp installer
  use 'williamboman/mason-lspconfig.nvim'
  use 'MunifTanjim/prettier.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'RRethy/nvim-treesitter-endwise'
  use 'andymass/vim-matchup' -- highlight set of matching texts
  use {
    'kylechui/nvim-surround',
    tag = "*",
  }
  use 'lukas-reineke/indent-blankline.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{ 'nvim-lua/plenary.nvim' }}
  }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'windwp/nvim-autopairs'
  use 'numToStr/Comment.nvim'
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use 'github/copilot.vim'
  use 'dinhhuy258/git.nvim'
  use 'lewis6991/gitsigns.nvim'
end)
