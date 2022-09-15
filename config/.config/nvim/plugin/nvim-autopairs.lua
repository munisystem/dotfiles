local no_errors, autopairs = pcall(require, "nvim-autopairs")
if (not no_errors) then
  return
end

-- configuration of <CR> behavior in coc-nvim
-- ref. https://github.com/windwp/nvim-autopairs/wiki/Completion-plugin
local remap = vim.api.nvim_set_keymap
autopairs.setup({map_cr=false})

_G.MUtils= {}

MUtils.completion_confirm=function()
  if vim.fn["coc#pum#visible"]() ~= 0  then
    return vim.fn["coc#pum#confirm"]()
  else
    return autopairs.autopairs_cr()
  end
end

remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
