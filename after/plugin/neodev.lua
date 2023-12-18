require('neodev').setup()

-- then setup your lsp server as usual
local lspconfig = require('lspconfig')

-- example to setup lua_ls and enable call snippets
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      completion = {
        callSnippet = "Replace"
      }
    }
  }
})
