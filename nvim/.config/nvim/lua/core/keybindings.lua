vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

map('v', '<', "<gv", opt)
map('v', '>', ">gv", opt)

map('i', "jk", "<Esc>", opt)
map('n', "<CR>", "o<Esc>", opt)

map('n', "<C-h>", "<C-w>h", opt)
map('n', "<C-j>", "<C-w>j", opt)
map('n', "<C-k>", "<C-w>k", opt)
map('n', "<C-l>", "<C-w>l", opt)

map('n', "<C-s>", ":w<Esc>", opt)

