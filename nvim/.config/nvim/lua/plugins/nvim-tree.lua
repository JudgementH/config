local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)

require("nvim-tree").setup()
