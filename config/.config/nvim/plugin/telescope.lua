local no_errors, telescope = pcall(require, 'telescope')
if (not no_errors) then
  return
end

local map = vim.keymap
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local fb = require "telescope".extensions.file_browser


telescope.setup({
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      }
    }
  },
  extensions = {
    file_browser = {
      hijack_netrw = true,
      respect_gitignore = false,
      initial_mode = "normal",
      grouped = true,
      mappings = {
        n = {
          ["n"] = fb.actions.create,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        }
      }
    }
  }
})
telescope.load_extension "file_browser"

map.set('n', '<leader>ff', function()
  builtin.find_files({
    no_ignore = false,
    hidden = true,
    file_ignore_patterns = { 'node_modules/.*', '.git/.*' }
  })
end)

map.set('n', '<leader>b', function()
  fb.file_browser({
    cwd = vim.fn.expand('%:p:h'),
  })
end)

map.set('n', '<leader>fg', function()
  builtin.live_grep()
end)

map.set('n', '<leader>fb', function()
  builtin.buffers()
end)
