local status, lspconfig = pcall(require, "lspconfig")
if (not status) then return end

local on_attach = function(client, bufnr)
    local opts = {noremap = true, silent = true}
    vim.keymap.set('n', "gd", "<cmd>Lspsaga lsp_finder<CR>", opts)
    vim.keymap.set('n', "gp", "<cmd>Lspsaga preview_definition<CR>", opts)
    vim.keymap.set('n', "gh", "<cmd>Lspsaga hover_doc<CR>", opts)
    vim.keymap.set('n', "gs", "<cmd>Lspsaga signature_help<CR>", opts)
    vim.keymap.set('n', "go", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    vim.keymap.set('n', "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    vim.keymap.set('n', "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    vim.keymap.set('n', "gr", "<cmd>Lspsaga rename<CR>", opts)
    vim.keymap.set('n', "ga", "<cmd>Lspsaga code_action<CR>", opts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.pyright.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}

require'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true)
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {enable = false}
        }
    }
}
