local no_errors, autopairs = pcall(require, "nvim-autopairs")
if (not no_errors) then
  return
end

autopairs.setup()
