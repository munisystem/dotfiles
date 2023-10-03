local no_errors, blankline = pcall(require, "ibl")
if not no_errors then
  return
end

blankline.setup({})
