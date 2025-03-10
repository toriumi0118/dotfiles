local M = {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
	},
	config = function()
		require("mason-null-ls").setup({
			ensure_installed = { "stylua", "eslint" },
			automatic_installation = true,
			handlers = {},
		})

		local augroup = vim.api.nvim_create_augroup("NullLspFormatting", {})
		require("null-ls").setup({
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr, async = true })
						end,
					})
				end
				-- On_attach(client, bufnr)
			end,
		})
	end,
}

return { M }
