local no_errors, mason = pcall(require, 'mason')
if (not no_errors) then return end

mason.setup({})

local no_errors, lspconfig = pcall(require, 'mason-lspconfig')
if (not no_errors) then return end

lspconfig.setup({
  ensure_installed = {
    'lua_ls',
    'gopls',
    'tsserver',
    'eslint',
    'astro',
    'tailwindcss',
    'dockerls'
  }
})
