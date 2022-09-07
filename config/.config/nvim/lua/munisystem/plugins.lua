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
  use {
    'neoclide/coc.nvim',
    branch = 'release'
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'RRethy/nvim-treesitter-endwise'
  use 'andymass/vim-matchup'
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
