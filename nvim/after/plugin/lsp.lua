local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- here you can setup the language servers
require'lspconfig'.lua_ls.setup{}
require'lspconfig'.marksman.setup{}
require'lspconfig'.anakin_language_server.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.tsserver.setup{}
