local no_errors, blankline = pcall(require, 'indent_blankline')
if (not no_errors) then
  return
end

blankline.setup({})
