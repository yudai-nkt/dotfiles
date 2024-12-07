--- @module "lazy.types"
--- @type LazyPluginSpec | LazyPluginSpec[]
return {
	"stevearc/conform.nvim",
	tag = "v8.2.0",
	--- @module "conform"
	--- @type conform.setupOpts
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
		},
		format_on_save = { timeout_ms = 1000 },
		notify_on_error = true,
	},
}
