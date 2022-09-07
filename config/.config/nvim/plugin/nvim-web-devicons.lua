local no_errors, devicons = pcall(require, "nvim-web-devicons")
if (not no_errors) then
  return
end

devicons.setup({})
