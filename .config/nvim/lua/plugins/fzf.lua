local search_cword = function()
  local word = vim.fn.expand('<cword>')
  vim.cmd('Rg ' .. word)
end

local M = {
  {
    "junegunn/fzf.vim",
    lazy = false,
    dependencies = { "junegunn/fzf", },
    keys = {
      { "<leader>f", ":Files<CR>", mode = "n", silent = true },
      { "<leader>G", ":GFiles?<CR>", mode = "n", silent = true },
      { "<leader>b", ":Buffers<CR>", mode = "n", silent = true },
      { "<leader>h", ":History<CR>", mode = "n", silent = true },
      { "<leader>w", ":Rg<CR>", mode = "n", silent = true },
      { "<leader>s", search_cword, mode = "n", silent = true },
    },
  },
}

vim.env.FZF_PREVIEW_COMMAND = "COLORTERM=truecolor bat --style=numbers --color=always --theme='Monokai Extended' {}"
vim.env.FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
vim.env.FZF_DEFAULT_COMMAND = 'rg --files'

return { M }
