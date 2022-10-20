local map = vim.keymap

-- define leader key
vim.g.mapleader = " "

-- move block easily
map.set("n", "<", "<<")
map.set("n", ">", ">>")

-- save quickly
map.set("n", "<space>w", "<cmd>w<cr>")

-- move around the window
map.set("n", "<space>k", "<C-w>k")
map.set("n", "<space>j", "<C-w>j")
map.set("n", "<space>l", "<C-w>l")
map.set("n", "<space>h", "<C-w>h")

-- backspace to delete without yank
map.set("n", "<BS>", [["_X]], { noremap = false })
map.set("v", "<BS>", [["_d]], { noremap = false })

-- deactivate highliting after search
map.set('n', "<ESC>", "<cmd>nohlsearch<cr>", {})

-- nvim-tree
map.set('n', '<leader>t', "<cmd>NvimTreeToggle<cr>", {})
