local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
    'wbthomason/packer.nvim',

    'Mofiqul/dracula.nvim',

    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },

    {
        'nvim-lualine/lualine.nvim',  -- 状态栏
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }  -- 状态栏图标
    },

    {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    },
    "nvim-treesitter/nvim-treesitter", -- 语法高亮
    "p00f/nvim-ts-rainbow", -- 配合treesitter，不同括号颜色区分

    'christoomey/vim-tmux-navigator',

    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",  -- 这个相当于mason.nvim和lspconfig的桥梁
        "neovim/nvim-lspconfig"
    },

    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip", -- snippets引擎，不装这个自动补全会出问题
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-path", -- 文件路径

    "numToStr/Comment.nvim",

    {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'},
    "lewis6991/gitsigns.nvim",

    'voldikss/vim-floaterm',

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }


}

local opts = {}
require("lazy").setup(plugins, opts)

