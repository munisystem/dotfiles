local no_errors, nightfox = pcall(require, 'nightfox')
if (not no_errors) then
  return
end

nightfox.setup({
  options = {
    transparent = true,
    terminal_colors = true,
  }
})
vim.cmd("colorscheme nightfox")
