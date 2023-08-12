local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations
require'lspconfig'.ltex.setup{
    filetypes =
    { "bib", "gitcommit", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc" }
}

-- volar/vue
local util = require 'lspconfig.util'
require'lspconfig'.volar.setup{
    init_options = 
    {
        typescript = 
        {
            tsdk = '/usr/local/lib/node_modules/typescript/lib'
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
}


-- for html install with sudo: npm i -g vscode-langservers-extracted
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}




lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    ["<CR>"] = cmp.mapping.confirm({select = true}),
    ["<c-Space>"] = cmp.mapping.complete()
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  }
})


