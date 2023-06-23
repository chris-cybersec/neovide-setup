local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  return
end


local mapping = cmp.mapping
local configs = cmp.config

cmp.setup({

 --snippet 
  snippet = {
    expand = function(args)
    luasnip.lsp_expand(args.body)
  end
  },
  
  -- window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  -- },

  --keymaps
  mapping = mapping.preset.insert({
    ["<C-b>"] = mapping.scroll_docs(-4),
    ["<C-f>"] = mapping.scroll_docs(4),
    ["<C-Space>"] = mapping.complete(),
    ["<C-c>"] = mapping.abort(),
    ["<CR>"] = mapping.confirm({ select = true }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items
  }),

  -- sources
  sources = configs.sources(
  {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, 
  {
    { name = "buffer", keyword_length = 5 }
  })


})
