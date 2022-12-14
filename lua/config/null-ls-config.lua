local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client) return client.name == "null-ls" end,
        bufnr = bufnr
    })
end

null_ls.setup {
    sources = {
        null_ls.builtins.formatting.lua_format,
        null_ls.builtins.diagnostics.fish,
        null_ls.builtins.formatting.fish_indent,
        null_ls.builtins.formatting.yapf,
        null_ls.builtins.formatting.latexindent,
        null_ls.builtins.diagnostics.chktex
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function() lsp_formatting(bufnr) end
            })
        end
    end
}
