-- Add an autocmd to set the filetype to "calendar" for "*.cal" files
vim.cmd([[
    augroup CalendarFileType
        autocmd!
        autocmd BufRead,BufNewFile *.cal setfiletype calendar
    augroup END
]])

require("myconfig")
