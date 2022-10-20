local status, builtin = pcall(require,'telescope.builtin')
if not status then return end

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
map.set('n', 't', "<cmd>NvimTreeToggle<cr>", {})

-- telescope
map.set('n', '<leader>ff', builtin.find_files, {})
map.set('n', '<leader>fg', builtin.live_grep, {})
map.set('n', '<leader>fb', builtin.buffers, {})
map.set('n', '<leader>fh', builtin.help_tags, {})
map.set('n', '<leader>fo', builtin.oldfiles, {})
