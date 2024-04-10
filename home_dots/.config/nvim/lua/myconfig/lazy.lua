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

require("lazy").setup({
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },

    { "caenrique/swap-buffers.nvim" },

    { "ibhagwan/fzf-lua" },

    {
    "numToStr/Comment.nvim",
    opts = {
    -- add any options here
    },
    lazy = false,
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },

    -- plenary is a requirement for harpoon
    {"nvim-lua/plenary.nvim"},
    {"ThePrimeagen/harpoon"},

    -- for latex
    { "lervag/vimtex" },

    -- ranger for neovim
    { "kevinhwang91/rnvimr" },

    -- type s and two characters to search 
    { "ggandor/leap.nvim"},

    -- lsp-zero
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
        },
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = { {'L3MON4D3/LuaSnip'}, }
    }
})
