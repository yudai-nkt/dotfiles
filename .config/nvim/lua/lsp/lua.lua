if vim.fn.exepath("lua-language-server") ~= "" then
  require("lspconfig").lua_ls.setup({})
else
  local util = require("util")
  vim.notify(
    "Lua Language Server is not installed",
    vim.log.levels.WARN,
    {
      title = string.format("Config in %s", util.get_config_path())
    }
  )
end
