local no_errors, bufferline = pcall(require, 'bufferline')
if (not no_errors) then
  return
end

bufferline.setup({
  options = {
    show_buffer_close_icons = false,
    show_close_icon = false
  }
})

vim.keymap.set('n', '<Tab>', '<CMD>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<CMD>BufferLineCycleNext<CR>', {})
