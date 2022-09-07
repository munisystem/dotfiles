local no_errors, comment = pcall(require, 'Comment')
if (not no_errors) then
  return
end

comment.setup({})
