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
	end,
}

return { M }
