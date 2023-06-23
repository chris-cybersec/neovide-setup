local lsp_status, lsp_zero = pcall(require, "lsp-zero")
if not lsp_status then
  return
end

local lspconfig_status,lspconfig = pcall(require, "lspconfig") 

local lsp = lsp_zero.preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- icons
lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

-- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- lua_ls
lspconfig.lua_ls.setup({
  single_file_support = false,
  on_attach = function (client, bufnr)
    print("hello lua_ls")
  end
})

-- tsserver
lspconfig.tsserver.setup{{     -- TODO
  single_file_support = false,
  on_attach = function(client, bufnr)
    print("hello tsserver")
  end
}}

lspconfig.eslint.setup({
  single_file_support = false,
  on_attach = function(client, bufnr)
    print('hello eslint')
  end
})

-- emmet
lspconfig.emmet_ls.setup({
  single_file_support = false,
  on_attach = function(client, bufnr)
    print('hello emmet')
  end
})

-- scss
lspconfig.cssls.setup({
  single_file_support = false,
  on_attach = function(client, bufnr)
    print('hello chris-css')
  end
})

-- html
lspconfig.html.setup({
  single_file_support = false,
  on_attach = function (client, bufnr)
    print("hello html")
  end
})

-- ******* format-on-save *************** TODO
-- lsp.format_on_save({
--   format_opts = {
--     async = false,
--     timeout_ms = 10000,
--   },
--   servers = {
--     ['lua_ls'] = {'lua'},
--     ['rust_analyzer'] = {'rust'},
--     -- if you have a working setup with null-ls
--     -- you can specify filetypes it can format.
--     -- ['null-ls'] = {'javascript', 'typescript'},
--   }
-- })

lsp.setup()

-- :echo executable("emmet_ls")
