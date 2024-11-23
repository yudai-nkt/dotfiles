if vim.fn.exepath("lua-language-server") ~= "" then
  require("lspconfig").lua_ls.setup({})
else
  vim.notify(
    "Lua Language Server is not installed",
    vim.log.levels.WARN,
  )
end
