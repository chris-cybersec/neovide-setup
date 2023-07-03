local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

local builtins = null_ls.builtins

null_ls.setup({
  sources = {
    builtins.formatting.prettier,
    -- builtins.formatting.stylua
  }
})
