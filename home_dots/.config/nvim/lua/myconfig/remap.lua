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
-- vim.keymap.set("v", "<leader>r", ":s/\\%V/R/g<Left><Left><Left><Left>")
vim.keymap.set("v", "<leader>r", ":s//R/g<Left><Left><Left><Left>")

-- move between splits
vim.keymap.set("n", "<c-h>", "<c-w><c-h>")
vim.keymap.set("n", "<c-j>", "<c-w><c-j>")
vim.keymap.set("n", "<c-k>", "<c-w><c-k>")
vim.keymap.set("n", "<c-l>", "<c-w><c-l>")
vim.keymap.set("t", "<c-h>", "<c-\\><c-N><c-w><c-h>")
vim.keymap.set("t", "<c-j>", "<c-\\><c-N><c-w><c-j>")
vim.keymap.set("t", "<c-k>", "<c-\\><c-N><c-w><c-k>")
vim.keymap.set("t", "<c-l>", "<c-\\><c-N><c-w><c-l>")
vim.keymap.set("n", "<Tab>", "<c-w>w")
vim.keymap.set("n", "<S-Tab>", "<c-w>W")

-- jumplist fix
vim.keymap.set("n", "<C-i>", "<C-I>")

-- resize splits
vim.keymap.set("n", "<c-left>", ":vertical resize -3<CR>")
vim.keymap.set("n", "<c-right>", ":vertical resize +3<CR>")
vim.keymap.set("n", "<c-up>", ":resize +3<CR>")
vim.keymap.set("n", "<c-down>", ":resize -3<CR>")

-- swap windows in splits
vim.keymap.set("n", "<c-s-h>", "[[<cmd>lua require('swap-buffers').swap_buffers('h')<CR>]]")
vim.keymap.set("n", "<c-s-j>", "[[<cmd>lua require('swap-buffers').swap_buffers('j')<CR>]]")
vim.keymap.set("n", "<c-s-k>", "[[<cmd>lua require('swap-buffers').swap_buffers('k')<CR>]]")
vim.keymap.set("n", "<c-s-l>", "[[<cmd>lua require('swap-buffers').swap_buffers('l')<CR>]]")
vim.keymap.set("t", "<c-s-h>", "<c-\\><c-N>[[<cmd>lua require('swap-buffers').swap_buffers('h')<CR>]]")
vim.keymap.set("t", "<c-s-j>", "<c-\\><c-N>[[<cmd>lua require('swap-buffers').swap_buffers('j')<CR>]]")
vim.keymap.set("t", "<c-s-k>", "<c-\\><c-N>[[<cmd>lua require('swap-buffers').swap_buffers('k')<CR>]]")
vim.keymap.set("t", "<c-s-l>", "<c-\\><c-N>[[<cmd>lua require('swap-buffers').swap_buffers('l')<CR>]]")

-- oil nvim
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- update, create sessions
local session_path = vim.fn.expand(os.getenv("SESSIONS")) .. "/"

local function update_session()
    local session_name = session_path .. vim.fn.fnamemodify(vim.v.this_session, ":t")
    vim.cmd("mksession! " .. session_name)
end

vim.keymap.set("n", "<leader>su", update_session)
vim.keymap.set("n", "<leader>sn", ":mksession " .. session_path)


-- jump to the beginning and end of a line
vim.keymap.set("n", "H", "^")
vim.keymap.set("v", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("v", "L", "$h")

-- switch to normal mode while in terminal
vim.keymap.set('t', '<c-n>', '<c-\\><c-N>')

-- open terminal and ranger
vim.keymap.set("n", "<leader>tx", ":belowright split | terminal<CR>")
vim.keymap.set("n", "<leader>tv", ":leftabove vsplit | terminal<CR>")
vim.keymap.set("n", "<leader><CR>", ":RnvimrToggle<CR>")

vim.keymap.set("n", ".", "@@")

vim.opt.clipboard = "unnamedplus"

-- start html live preview
-- release
vim.keymap.set("n", "<leader>pr", ":belowright 15split | terminal html_preview $NOTEROOT '%:p'<CR>")
-- debug
vim.keymap.set("n", "<leader>pd", ":belowright 15split | terminal html_preview_debug $NOTEROOT '%:p'<CR>")

-- shuffle playlist
vim.keymap.set("n", "<leader>sh", ":%!shuf<CR>")


-- fold code and toggle with za
-- vim.keymap.set("n", "zf", "zfa{")
