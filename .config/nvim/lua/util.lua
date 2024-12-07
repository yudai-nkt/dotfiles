local M = {}

--- This function returns a path of a file where it is *called*.
--- The returned path is resolved relative to NeoVim config root.
M.get_config_path = function()
	local source = debug.getinfo(2, "S").source
	local config_root_matcher = string.format("%s/(%%w+)", vim.fn.stdpath("config"))
	return source:sub(1, 1) == "@" and string.gsub(vim.fn.fnamemodify(source:sub(2), ":p"), config_root_matcher, "%1")
		or nil
end

return M
