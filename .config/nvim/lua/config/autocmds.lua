vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end -- 安全チェック

		-- textDocument/formatting をサポートしている場合
		if client.supports_method and client:supports_method("textDocument/formatting") then
			-- 既存の `BufWritePre` がないかチェック
			local existing_autocmds = vim.api.nvim_get_autocmds({
				event = "BufWritePre",
				buffer = args.buf,
			})

			if #existing_autocmds == 0 then -- すでに登録されていない場合のみ追加
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = args.buf,
					callback = function()
						vim.lsp.buf.format({ bufnr = args.buf, id = client.id, async = false })
					end,
				})
			end
		end
	end,
})
