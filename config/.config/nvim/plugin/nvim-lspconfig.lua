local no_errors, lspconfig = pcall(require, 'lspconfig')
if (not no_errors) then
  return
end

local keymap = vim.keymap

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true, buffer=bufnr }
  keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

  -- Format using prettier instead of typescript-language-server
  if client.name == 'tsserver' then
    client.server_capabilities.documentFormattingProvider = false
  end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local util = require('lspconfig/util')

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
  }
)

-- Javascript / Typescript configurations
lspconfig.tsserver.setup {
  on_attach = on_attach,
  filetypes = {
    'typescript',
    'typescriptreact',
    'javascript',
    'javascriptreact'
  },
  cmd = {
    'typescript-language-server',
    '--stdio'
  },
  capabilities = capabilities
}

lspconfig.eslint.setup {
  on_attach = on_attach,
  filetypes = {
    'typescript',
    'typescriptreact',
    'javascript',
    'javascriptreact'
  },
  capabilities = capabilities
}

lspconfig.astro.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- Go configurations
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'gopls', 'serve' },
  filetypes = { 'go', 'gomod' },
  root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
  init_options = {
    completeUnimported = true
  },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true
      },
      staticcheck = true
    }
  }
}

-- Lua configurations
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true)
      }
    }
  }
}

lspconfig.pylsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.pyre.setup {}

-- Import missing packages using gopls
-- cf. https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim-imports
local function goimports(wait_ms)
  return function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { 'source.organizeImports' } }
    local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params, wait_ms)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or 'utf-16'
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
  end
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go" },
  callback = goimports()
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go" },
  callback = function()
	  vim.lsp.buf.format()
  end,
})

lspconfig.dockerls.setup {}
