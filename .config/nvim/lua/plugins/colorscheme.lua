--- @module "lazy.types"
--- @type LazyPluginSpec | LazyPluginSpec[]
return {
	"catppuccin/nvim",
	tag = "v1.9.0",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "frappe",
		transparent_background = true,
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
