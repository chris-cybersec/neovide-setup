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
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
-- enable supertab
  mapping = {
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  },

  sources = {
    {name = "luasnip", keyword_length = 2},
    {name = "nvim_lsp"},
    {name = "buffer", keyword_length = 3},
    {name = "path"}
  },

  snippet = {
    expand = function (args)
      require("luasnip").lsp_expand(args.body)
    end
  },

  formatting = {
    fields = {"menu", "abbr", "kind"},

        -- here is where the change happens
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
        nvim_lua = 'Π',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  }
})
