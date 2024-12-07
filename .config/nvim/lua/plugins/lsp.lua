--- @module "lazy.types"
--- @type LazyPluginSpec | LazyPluginSpec[]
return {
	"neovim/nvim-lspconfig",
	tag = "v1.0.0",
	config = function()
		local servers = vim.fs.dir(vim.fn.stdpath("config") .. "/lua/lsp/")
		for name, _ in servers do
			require(string.format("lsp.%s", string.gsub(name, "(%w+)%.lua", "%1")))
		end
	end,
}
