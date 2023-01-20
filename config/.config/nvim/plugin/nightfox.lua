local no_errors, nightfox = pcall(require, 'nightfox')
if (not no_errors) then
  return
end

nightfox.setup({})
vim.cmd("colorscheme nightfox")
