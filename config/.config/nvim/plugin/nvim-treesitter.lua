local no_errors, treesitter = pcall(require, 'nvim-treesitter.configs')
if (not no_errors) then
  return
end

treesitter.setup{
  ensure_installed = {
    'lua',
    'yaml',
    'toml',
    'json',
    'proto',
    'go',
    'tsx',
    'typescript',
    'html',
    'css'
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  autotag = {
    enable = true
  },
  endwise = {
    enable = true
  },
  matchup = {
    enable = true
  }
}

local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
parser_config.tsx.filetype_to_parsername = { 'javascript', 'typescript.tsx' }
