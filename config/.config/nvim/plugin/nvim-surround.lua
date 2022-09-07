local no_errors, surround = pcall(require, "nvim-surround")
if (not no_errors) then
  return
end

surround.setup({})
