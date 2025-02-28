local M = {
	"tpope/vim-fugitive",
	lazy = false,
	keys = {
		{ "<leader>gs", ":G<CR>", mode = "n", silent = true, desc = "Git Status" },
		{ "<leader>ga", ":Gwrite<CR>", mode = "n", silent = true, desc = "Git Add Current File" },
		{ "<leader>gc", ":G commit -v<CR>", mode = "n", silent = true, desc = "Git Commit" },
		{ "<leader>gb", ":G blame<CR>", mode = "n", silent = true, desc = "Git Blame" },
		{ "<leader>gd", ":Gvdiffsplit!<CR>", mode = "n", silent = true, desc = "Git Diff Split" },
		{ "<leader>gm", ":G mergetool<CR>", mode = "n", silent = true, desc = "Git Mergetool" },
		{ "<leader>gp", ":G push -u<CR>", mode = "n", silent = true, desc = "Git Push" },
		{ "<leader>gl", ":Gclog<CR>", mode = "n", silent = true, desc = "Git Log" },
	},
}

return { M }
