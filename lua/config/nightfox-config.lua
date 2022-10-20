local status, nf = pcall(require, "nightfox")
if (not status) then return end

nf.setup({
    options = {
        transparent = true,
        styles = {comments = "italic", keywords = "bold", types = "italic,bold"}
    }
})

-- setup must be called before loading
vim.cmd("colorscheme nightfox")
