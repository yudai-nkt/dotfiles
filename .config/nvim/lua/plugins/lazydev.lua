--- @module "lazy.types"
--- @type LazyPluginSpec | LazyPluginSpec[]
return {
	-- Since vim.api.nvim_get_runtime_file does not look for
	-- lua plugin sources that are lazy-loaded, this plugin is
	-- introduced instead of enumerating plugin entries using
	-- require("lazy").plugins().
	"folke/lazydev.nvim",
	opts = {},
}
