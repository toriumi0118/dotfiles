local M = {
	"elentok/format-on-save.nvim",
	dependencies = {
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	},
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- -- you can pin a tool to a particular version
				-- { "golangci-lint", version = "v1.47.0" },

				-- -- you can turn off/on auto_update per tool
				-- { "bash-language-server", auto_update = true },

				-- -- you can do conditional installing
				-- {
				-- 	"gopls",
				-- 	condition = function()
				-- 		return not os.execute("go version")
				-- 	end,
				-- },
				"stylua",
				"eslint_d",
				"prettier",
				"jq", -- for json
			},
		})
		local format_on_save = require("format-on-save")
		local formatters = require("format-on-save.formatters")

		local typescript = {
			formatters.if_file_exists({
				pattern = ".eslintrc.*",
				-- formatter = formatters.lsp,
				formatter = formatters.eslint_d_fix,
			}),
			-- formatters.prettierd,
		}

		format_on_save.setup({
			experiments = {
				partial_update = "line-by-line", -- or 'line-by-line'
				-- partial_update = "diff", -- or 'line-by-line'
			},
			exclude_path_patterns = {
				"/node_modules/",
				".local/share/nvim/lazy",
			},
			formatter_by_ft = {
				lua = formatters.stylua,

				typescript = typescript,
				typescriptreact = typescript,

				-- prettierdだとたまに文字化けするので
				yaml = formatters.shell({ cmd = { "prettier", "--stdin-filepath", "%" } }),
				json = formatters.shell({ cmd = { "jq", "." } }),

				-- css = formatters.lsp,
				-- html = formatters.lsp,
				-- java = formatters.lsp,
				-- javascript = formatters.lsp,
				-- rust = formatters.lsp,
				-- markdown = formatters.prettier,
				-- openscad = formatters.lsp,
				-- python = formatters.black,
				-- rust = formatters.lsp,
				-- scad = formatters.lsp,
				-- scss = formatters.lsp,
				-- sh = formatters.shfmt,
				-- terraform = formatters.lsp,
				-- dart = formatters.lsp,
				-- graphql = formatters.lsp,
				-- yaml = formatters.shell({ cmd = { "prettier", "--write", "%" } }),

				-- -- Add your own shell formatters:
				-- myfiletype = formatters.shell({ cmd = { "myformatter", "%" } }),

				-- -- Add lazy formatter that will only run when formatting:
				-- my_custom_formatter = function()
				-- 	if vim.api.nvim_buf_get_name(0):match("/README.md$") then
				-- 		return formatters.prettier
				-- 	else
				-- 		return formatters.lsp()
				-- 	end
				-- end,

				-- -- Add custom formatter
				-- filetype1 = formatters.remove_trailing_whitespace,
				-- filetype2 = formatters.custom({
				-- 	format = function(lines)
				-- 		return vim.tbl_map(function(line)
				-- 			return line:gsub("true", "false")
				-- 		end, lines)
				-- 	end,
				-- }),

				-- -- Concatenate formatters
				-- python = {
				-- 	formatters.remove_trailing_whitespace,
				-- 	formatters.shell({ cmd = "tidy-imports" }),
				-- 	formatters.black,
				-- 	formatters.ruff,
				-- },

				-- -- Use a tempfile instead of stdin
				-- go = {
				-- 	formatters.shell({
				-- 		cmd = { "goimports-reviser", "-rm-unused", "-set-alias", "-format", "%" },
				-- 		tempfile = function()
				-- 			return vim.fn.expand("%") .. ".formatter-temp"
				-- 		end,
				-- 	}),
				-- 	formatters.shell({ cmd = { "gofmt" } }),
				-- },

				-- Add conditional formatter that only runs if a certain file exists
				-- in one of the parent directories.
			},
		})
	end,
}

return { M }
