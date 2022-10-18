local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.init_lsp_saga {
  server_filetype_map = {
    typescript = 'typescript'
  }
}


local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', 'gp', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
-- vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
-- vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
-- vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
-- vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)

-- lsp-saga
vim.keymap.set('n', "gd", "<cmd>Lspsaga lsp_finder<CR>", opts)
vim.keymap.set('n', "gp", "<cmd>Lspsaga preview_definition<CR>", opts)
vim.keymap.set('n', "gh", "<cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set('n', "gs", "<cmd>Lspsaga signature_help<CR>", opts)
vim.keymap.set('n', "go", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
vim.keymap.set('n', "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set('n', "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set('n', "gr", "<cmd>Lspsaga rename<CR>", opts)
vim.keymap.set('n', "ga", "<cmd>Lspsaga code_action<CR>", opts)
