local opt = vim.opt

opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
vim.scriptencoding = 'utf-8'

opt.title = true
opt.undofile = true
opt.cursorline = true
opt.number = true
opt.relativenumber = false
opt.smartindent = true
opt.expandtab = true
opt.smarttab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.wrapscan = true
opt.inccommand = 'split'
opt.termguicolors = true
opt.path:append { '**' } -- enable search in subdirectories

if vim.fn.has('macunix') == 1 then
  opt.clipboard:append { 'unnamedplus' }
end

require('munisystem/plugins')
