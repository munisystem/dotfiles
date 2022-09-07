local no_errors, onedark = pcall(require, 'onedark')
if (not no_errors) then
  return
end

onedark.setup({
  style = 'warm',
  transparent = true,
  term_colors = true
})
onedark.load()
