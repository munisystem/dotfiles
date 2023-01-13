local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'navarasu/onedark.nvim',
  'nvim-lua/plenary.nvim',
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lsp-signature-help', -- show function signatures duaring insertion.
  'onsails/lspkind-nvim', -- use VSCode like icons in lsp
  'L3MON4D3/LuaSnip', -- expand suggestion in nvim-cmp
  'williamboman/mason.nvim', -- lsp installer
  'williamboman/mason-lspconfig.nvim',
  'MunifTanjim/prettier.nvim',
  'jose-elias-alvarez/null-ls.nvim',
  {
    'nvim-treesitter/nvim-treesitter',
    build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  },
  'RRethy/nvim-treesitter-endwise',
  'andymass/vim-matchup', -- highlight set of matching texts
  {
    'kylechui/nvim-surround',
    version = "*",
  },
  'lukas-reineke/indent-blankline.nvim',
  'kyazdani42/nvim-web-devicons',
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {{ 'nvim-lua/plenary.nvim' }}
  },
  'nvim-telescope/telescope-file-browser.nvim',
  'windwp/nvim-autopairs',
  'numToStr/Comment.nvim',
  {
    'akinsho/bufferline.nvim',
    version = "v2.*",
    dependencies = 'kyazdani42/nvim-web-devicons'
  },
  'github/copilot.vim',
  'dinhhuy258/git.nvim',
  'lewis6991/gitsigns.nvim',
})
