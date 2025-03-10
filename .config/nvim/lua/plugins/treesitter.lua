local M = {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		{ "windwp/nvim-ts-autotag" },
	},
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				-- "bash",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				-- "toml",
				"tsx",
				"typescript",
				"yaml",
				-- "dart",
				-- "rust",
				-- "graphql",
			},
			sync_install = true,
			highlight = { enable = true },
		})
	end,
}

return { M }
