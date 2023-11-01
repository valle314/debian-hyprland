function ChangeMyHighlights()
    -- look in :highlight for more infos. its setting the color of the highlighted search
    vim.cmd('highlight Search guifg=#f4e1b5, guibg=#50a000')
    vim.cmd('highlight CurSearch guifg=#f4e1b5, guibg=#ea198c')

    -- Change the color of the matching curly brackets
    vim.cmd('highlight MatchParen ctermfg=black guibg=#50a000')

    -- for active window has orange statusline
    vim.cmd("highlight StatusLine guifg=#10111A guibg=#CBA240")
    vim.cmd("highlight StatusLineNC guifg=#10111A guibg=#665120")

    -- active tab
    vim.cmd("highlight TabLineSel guifg=#10111A guibg=#CBA240")
    vim.cmd("highlight TabLine guifg=#CBA240 guibg=#45475a")
end

vim.cmd("autocmd BufEnter * lua ChangeMyHighlights()")
-- ChangeMyHighlights()
