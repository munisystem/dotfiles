local no_errors, git = pcall(require, 'git')
if (not no_errors) then
  return
end

git.setup({
  keymaps = {
    blame = "<leader>gb",
    quit_blame = "q",
  }
})
