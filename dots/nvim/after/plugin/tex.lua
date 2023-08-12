vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')
vim.g.vimtex_view_method = 'sioyek'
vim.g.vimtex_compiler_method = 'latex-mk'

vim.api.nvim_set_var('maplocalleader', ' ')

vim.keymap.set("n", "<leader>li", ":VimtexView<CR>")
