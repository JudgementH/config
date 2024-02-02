local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)

local api = require('nvim-tree.api')

local function my_on_attach(bufnr)
    local function opts(desc)
        return {
        desc = 'nvim-tree: ' .. desc,
        buffer = bufnr,
        noremap = true,
        silent = true,
        nowait = true,
        }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set('n', '?', api.tree.toggle_help, opts 'Help')
end

require('nvim-tree').setup({
    view = {
        width = 35,
    },
    on_attach = my_on_attach,
    filters = {
        custom = { '^.git$' },
    },
    actions = {
        open_file = { quit_on_open = true },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    git = {
        enable = false,
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
        hint = '',
        info = '',
        warning = '',
        error = '',
        },
    },
    })
