local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

local lsp_zero_status, lsp_zero = pcall(require, "lsp-zero")
if not lsp_zero_status then
  return
end

local cmp_action = lsp_zero.cmp_action()
-- will exclude all javascript snippets
-- require("luasnip.loaders.from_vscode").load {
 --   exclude = { "javascript" },
-- }
-- require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
-- enable supertab
 mapping = {
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  }

--   {name = "luasnip", keyword_length = 2},
--   {name = "nvim_lsp"},
--   {name = "buffer", keyword_length = 3},
--   {name = "path"}


})
