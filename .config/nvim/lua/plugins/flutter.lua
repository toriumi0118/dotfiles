local M = {
	"nvim-flutter/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"dart-lang/dart-vim-plugin",
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	},
	config = function()
		require("flutter-tools").setup({
			flutter_path = nil,
			flutter_lookup_cmd = "asdf where flutter",
			fvm = false,
			decorations = {
				statusline = {
					app_version = true,
					device = true,
				},
			},
			widget_guides = {
				enabled = true,
			},
			lsp = {
				on_attach = On_attach,
				color = {
					enabled = true,
					background = true,
					foreground = false,
					virtual_text = true,
					virtual_text_str = "■",
				},
				settings = {
					showTodos = true,
					completeFunctionCalls = true,
					enableSnippets = true,
				},
			},
			settings = {
				enableSnippets = false,
			},
		})

		vim.g.dart_style_guide = 2
		vim.g.dart_format_on_save = 1
		vim.g.dart_trailing_comma_indent = true
	end,
}

return { M }
