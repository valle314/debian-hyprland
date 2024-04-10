vim.api.nvim_set_hl(0, 'LeapBackdrop', { fg = '#6C7086' })
vim.api.nvim_set_hl(0, 'LeapMatch', {
  fg = 'white', bold = true, nocombine = true,
})

require('leap').add_default_mappings()
