On_attach = function(client, bufnr)
	-- LSPが持つフォーマット機能を無効化する
	-- →例えばtsserverはデフォルトでフォーマット機能を提供しますが、利用したくない場合はコメントアウトを解除してください
	--client.server_capabilities.documentFormattingProvider = false

	-- 下記ではデフォルトのキーバインドを設定しています
	-- ほかのLSPプラグインを使う場合（例：Lspsaga）は必要ないこともあります

	local set = vim.keymap.set
	set("n", "<leader>d", "<cmd>lua vim.lsp.buf.definition()<CR>")
	set("n", "<leader>y", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
	set("n", "<leader>i", "<cmd>lua vim.lsp.buf.implementation()<CR>")
	set("n", "<leader>r", "<cmd>lua vim.lsp.buf.references()<CR>")
	set("i", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	set("n", "<leader>k", "<cmd>lua vim.lsp.buf.hover()<CR>")
	set("n", "<leader>n", "<cmd>lua vim.lsp.buf.rename()<CR>")
	set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>")
	set("n", "<leader>ll", "<cmd>lua vim.diagnostic.open_float()<CR>")
	set("n", "<leader>ld", "<cmd>lua vim.diagnostic.setqflist()<CR>")
	set("n", "<leader>lp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
	set("n", "<leader>ln", "<cmd>lua vim.diagnostic.goto_next()<CR>")

	vim.diagnostic.config({ severity_sort = true })

	--   -- フォーマット機能を有効化
	--   if client.supports_method('textDocument/formatting') then
	--     vim.api.nvim_create_autocmd("BufWritePre", {
	--       buffer = bufnr,
	--       callback = function()
	--         vim.lsp.buf.format({ bufnr = bufnr, async = false })
	--       end,
	--     })
	--   end
end

local function setup_lua(config)
	config.on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = true
		On_attach(client, bufnr)
	end
end

-- 言語サーバーごとの個別設定
local server_configs = {
	-- prettierd = setup_prettierd
	-- lua_ls = setup_lua,
}

local M = {
	"williamboman/mason.nvim",
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "neovim/nvim-lspconfig" },
	},
	config = function()
		require("mason").setup({
			PATH = "append",
		})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"bashls",
				"cssls",
				"dockerls",
				"gradle_ls",
				"graphql",
				"html",
				"ts_ls",
				"eslint",
				"jsonls",
				"lua_ls",
				"ruby_lsp",
				"sqlls",
				"terraformls",
				"tflint",
			},
		})

		require("mason-lspconfig").setup_handlers({
			function(server_name)
				local config = {
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
					on_attach = On_attach,
				}

				-- 言語サーバーごとの設定関数を呼び出す
				if server_configs[server_name] then
					server_configs[server_name](config)
				end

				require("lspconfig")[server_name].setup(config)
			end,
		})

		local lspconfig = require("lspconfig")
		lspconfig.rust_analyzer.setup({
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			on_attach = On_attach,
			settings = { ["rust-analyzer"] = {} },
		})
	end,
}

return { M }
