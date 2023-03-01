local no_errors, lspsaga = pcall(require, "lspsaga")
if (not no_errors) then return end

lspsaga.setup({
  ui = {
    border = "double",
    title = true,
  },
  diagnostic = {
    swhow_code_action = false,
  },
  symbol_in_winbar = {
    enable = false,
  }
})

local keymap = vim.keymap.set
keymap('n', 'gl', "<cmd>Lspsaga show_line_diagnostics<CR>")
keymap("n", "gd", "<cmd>Lspsaga lsp_finder<CR>")
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>")
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
keymap("n", "gh", "<cmd>Lspsaga hover_doc<CR>")
