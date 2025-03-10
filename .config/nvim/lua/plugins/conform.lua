local M = {
	"stevearc/conform.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"zapling/mason-conform.nvim",
	},
	config = function()
		require("mason-conform").setup()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- You can customize some of the format options for the filetype (:help conform.format)
				rust = { "rustfmt", lsp_format = "fallback" },
				-- Conform will run the first available formatter
				-- javascript = { "eslint_d_fix", "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "eslint", stop_after_first = true },
				-- javascriptreact = { "eslint", "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "eslint", stop_after_first = true },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
	opts = {},
}

return { M }
