--- @module "lazy.types"
--- @type LazyPluginSpec | LazyPluginSpec[]
return {
	"rcarriga/nvim-notify",
	tag = "v3.14.0",
	-- other plugins and my config might send notifications,
	-- so priority should be higher than the default.
	priority = 100,
	config = function()
		vim.notify = require("notify")
	end,
}
