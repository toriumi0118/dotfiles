local M = {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			panel = { enabled = false },
			suggestion = {
				enabled = true,
				auto_trigger = true,
				hide_during_completion = false,
				debounce = 15,
				keymap = {
					accept = "<C-l>",
					next = "<C-k>",
					prev = "<C-i>",
					dismiss = false,
				},
			},
			filetypes = {
				yaml = true,
				csv = true,
			},
		})

		vim.keymap.set("i", "<Tab>", function()
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
		end, { desc = "Normal Tab" })
	end,
}

return { M }
