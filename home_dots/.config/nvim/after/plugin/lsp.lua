local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
end)

-- configure some servers
local util = require 'lspconfig.util'
lsp_zero.configure('volar', {
    init_options =
    {
        typescript =
        {
            tsdk = "/home/valentin/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib"
        },
    },
    filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json', "css", "scss", "html"},
    -- root_dir = util.root_pattern 'package.json'
    root_dir = function(fname)
        -- local notedir = os.getenv("NOTEROOT")
        -- if notedir then
        --     return notedir
        -- else
        --     return util.find_git_ancestor(fname) or vim.loop.cwd()
        -- end
        return util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end
})


require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_format = lsp_zero.cmp_format()

cmp.setup({
  formatting = cmp_format,
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    ["<CR>"] = cmp.mapping.confirm({select = true}),
    ["<C-Space>"] = cmp.mapping.complete()
  }),
  window = 
  {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  }
})
