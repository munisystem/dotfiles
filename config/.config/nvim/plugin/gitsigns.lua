local no_errors, gitsigns = pcall(require, 'gitsigns')
if (not no_errors) then
  return
end

gitsigns.setup({})
