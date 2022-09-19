local no_errors, prettier = pcall(require, 'prettier')
if (not no_errors) then return end

prettier.setup({
  filetypes = {
    'typescript',
    'typescriptreact',
    'javascript',
    'javascriptreact'
  }
})
