-- with tab and shift tab you can tab your selection in and out 
vim.keymap.set("n", "<leader>h", ":noh<CR>")
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- moving visual selected code snippets up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- better scrolling and searching
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- if you replace something the clipboard stays the same
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<c-s>", ":w<CR>")

vim.keymap.set("n", "Q", "<nop>")

-- find and replace
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- NOT NEEDED??
-- vim.keymap.set("v", "<leader>R", ":s/\\%V\\<\\>/R/g<Left><Left><Left><Left><Left><Left>")

-- replace everything your visual selection
vim.keymap.set("v", "<leader>r", ":s/\\%V/R/g<Left><Left><Left><Left>")

-- you can switch to other screens in split view
vim.keymap.set("n", "<Tab>", "<c-w>w")
vim.keymap.set("n", "<S-Tab>", "<c-w>W")

-- closing a tab
vim.keymap.set("n", "<c-w>", "ZZ")

-- skip real words with b,e and w
vim.keymap.set("n", "w", "W")
vim.keymap.set("v", "w", "W")
vim.keymap.set("n", "b", "B")
vim.keymap.set("v", "b", "B")
vim.keymap.set("n", "e", "E")
vim.keymap.set("v", "e", "E")

-- jump to the beginning and end of a line
vim.keymap.set("n", "B", "^")
vim.keymap.set("v", "B", "^")
vim.keymap.set("n", "E", "$")
vim.keymap.set("v", "E", "$h")
vim.keymap.set("n", "W", "$")
vim.keymap.set("v", "W", "$h")

-- switch to normal mode while in terminal
vim.keymap.set('t', '<c-n>', '<c-\\><c-N>')

-- open terminal and ranger
vim.keymap.set("n", "<S-CR>", ":belowright 15split | terminal<CR>I")

vim.keymap.set("n", ".", "@@")

vim.keymap.set('n', 'f<leader>', ":call search(\"[][\\\"'(){}<>]\", \"W\")<CR>")
vim.keymap.set('n', 'F<leader>', ":call search(\"[][\\\"'(){}<>]\", \"bW\")<CR>")
vim.keymap.set('v', 'f<leader>', "omao<c-c>:call search(\"[][\\\"'(){}<>]\", \"W\")<CR>mb`av`b")
vim.keymap.set('v', 'F<leader>', "omao<c-c>:call search(\"[][\\\"'(){}<>]\", \"bW\")<CR>mb`av`b")

vim.opt.clipboard = "unnamedplus"

-- start html live preview
-- release
vim.keymap.set("n", "<leader>pr", ":belowright 15split | terminal html_preview $NOTEROOT '%:p'<CR>")
-- debug
vim.keymap.set("n", "<leader>pd", ":belowright 15split | terminal html_preview_debug $NOTEROOT '%:p'<CR>")

-- shuffle playlist
vim.keymap.set("n", "<leader>sh", ":%!shuf<CR>")
