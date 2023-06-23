local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

-- will exclude all javascript snippets
-- require("luasnip.loaders.from_vscode").load {
 --   exclude = { "javascript" },
-- }
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  {name = "luasnip", keyword_length = 2},
  {name = "nvim_lsp"},
  {name = "buffer", keyword_length = 3},
  {name = "path"}
})
