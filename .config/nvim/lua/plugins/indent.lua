--- @module "lazy.types"
--- @type LazyPluginSpec | LazyPluginSpec[]
return {
  {
    "lukas-reineke/indent-blankline.nvim",
    tag = "v3.8.5",
    main = "ibl",
    --- @module "ibl"
    --- @type ibl.config
    opts = {
      indent = {
        char = "|"
      }
    }
  }
}
