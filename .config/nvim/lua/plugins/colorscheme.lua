--- @module "lazy.types"
--- @type LazyPluginSpec | LazyPluginSpec[]
return {
	"rose-pine/neovim",
	tag = "v3.0.2",
	name = "rose-pine",
	priority = 1000,
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
