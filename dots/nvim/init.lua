-- Add an autocmd to set the filetype to "calendar" for "*.cal" files
vim.cmd([[
    augroup CalendarFileType
        autocmd!
        autocmd BufRead,BufNewFile *.cal setfiletype calendar
    augroup END

    augroup remember_folds
        autocmd!
        autocmd BufWinLeave *.* mkview
        autocmd BufWinEnter *.* silent! loadview
    augroup END

    augroup my_color_scheme
        autocmd BufEnter * lua Default_color_scheme()
        autocmd BufEnter *.tex lua Latex_color_scheme()
    augroup END
]])


require("myconfig")
