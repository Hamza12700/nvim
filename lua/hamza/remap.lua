vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set('n', '<leader>e', vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

