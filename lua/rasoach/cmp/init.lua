local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

local lsp_zero_status, lsp_zero = pcall(require, "lsp-zero")
if not lsp_zero_status then
  return
end


local cmp_action = lsp_zero.cmp_action()
local cmp_mapping = cmp.mapping
-- will exclude all javascript snippets
-- require("luasnip.loaders.from_vscode").load {
 --   exclude = { "javascript" },
-- }
--  import only snippet like this -- very important -- i spent more than 2 weeks with this stuff
require("luasnip.loaders.from_lua").load({ paths = "~/AppData/Local/nvim/snippets/" })


cmp.setup({
--mapping
  mapping = {
  -- enable supertab
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),

    ["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<A-o>"] = cmp.mapping.select_prev_item(),
		["<A-i>"] = cmp.mapping.select_next_item(),
		["<A-u>"] = cmp.mapping.confirm({ select = true }),
		-- 	["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		-- 	["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		-- 	["<C-i>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		--	["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- 	-- Accept currently selected item. If none selected, `select` first item.
		-- 	-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		-- ["<Space><Space>"] = cmp.mapping.confirm({ select = false }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

  },

-- sources 
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

-- ui
window = {
  documentation = {
    max_height = 60,
    max_width = 60
  }
},

-- formatting
  formatting = {
    fields = {"menu", "abbr", "kind"},
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
  },

  confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},


})
