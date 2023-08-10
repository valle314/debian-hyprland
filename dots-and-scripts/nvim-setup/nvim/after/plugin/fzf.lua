vim.keymap.set("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>")
-- live_grep could be faster in large projects but there is no fuzyy searching
-- vim.keymap.set("n", "<leader>fg", "<cmd>lua require('fzf-lua').live_grep()<CR>")
vim.keymap.set("n", "<leader>fg", "<cmd>lua require('fzf-lua').grep_project()<CR>")
