local no_errors, gitsigns = pcall(require, 'gitsigns')
if (not no_errors) then
  return
end

gitsigns.setup({
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 1000,
    ignore_whitespace = false
  }
})
