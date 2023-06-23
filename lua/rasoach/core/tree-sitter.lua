local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

local rainbow_status, rainbow = pcall(require, "ts-rainbow")
if not rainbow_status then
  return
end

configs.setup {
 -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "lua", "css", "scss", "dockerfile", "javascript", "yaml", "regex", "html", "http", "gitignore", "markdown_inline", "markdown", "vim", "vimdoc", "json", "json5" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

highlight = { enable = true },


--rainbow
rainbow = {
  enable = true,
  query = {
    "rainbow-parens",
    javascript = "rainbow-parens-react"
  },
  strategy = rainbow.strategy.global,
  hlgroups = {
               'TSRainbowRed',
               'TSRainbowCyan',
               'TSRainbowYellow',
               'TSRainbowBlue',
               'TSRainbowOrange',
               'TSRainbowGreen',
               'TSRainbowViolet'
            },
},

-- autoclose Tag
autotag = {
    enable = true,
  },
}
