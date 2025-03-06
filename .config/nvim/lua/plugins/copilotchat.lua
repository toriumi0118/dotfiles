local M = {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "main",
	-- cmd = "CopilotChat",
	dependencies = {
		{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
		{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		{
			"ibhagwan/fzf-lua",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			config = function()
				require("fzf-lua").register_ui_select()
			end,
		},
	},
	opts = function()
		local user = vim.env.USER or "User"
		user = user:sub(1, 1):upper() .. user:sub(2)
		return {
			-- model = "gpt-4o", -- Default model to use, see ':CopilotChatModels' for available models (can be specified manually in prompt via $).
			model = "claude-3.7-sonnet",
			auto_insert_mode = true,
			question_header = "  " .. user .. " ",
			answer_header = "  Copilot ",
			window = { width = 0.4 },
		}
	end,
	keys = {
		{ "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
		{ "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
		{
			"<leader>aa",
			function()
				return require("CopilotChat").toggle()
			end,
			desc = "Toggle (CopilotChat)",
			mode = { "n", "v" },
		},
		{
			"<leader>ax",
			function()
				return require("CopilotChat").reset()
			end,
			desc = "Clear (CopilotChat)",
			mode = { "n", "v" },
		},
		{
			"<leader>aq",
			function()
				vim.ui.input({
					prompt = "Quick Chat: ",
				}, function(input)
					if input ~= "" then
						require("CopilotChat").ask(input)
					end
				end)
			end,
			desc = "Quick Chat (CopilotChat)",
			mode = { "n", "v" },
		},
		{
			"<leader>ap",
			function()
				require("CopilotChat").select_prompt()
			end,
			desc = "Prompt Actions (CopilotChat)",
			mode = { "n", "v" },
		},
	},
	config = function(_, opts)
		require("fzf-lua").register_ui_select()

		local chat = require("CopilotChat")
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "copilot-chat",
			callback = function()
				vim.opt_local.relativenumber = false
				vim.opt_local.number = false
			end,
		})

		vim.opt.splitright = true
		chat.setup(opts)
	end,
}

return { M }
