if vim.fn.exepath("clangd") ~= "" then
	require("lspconfig").clangd.setup({})
else
	local util = require("util")
	vim.notify("clangd is not installed.", vim.log.levels.WARN, {
		title = string.format("Config in %s", util.get_config_path()),
	})
end
