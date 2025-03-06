-- global
vim.g.python3_host_prog = "$HOMEBREW_PREFIX/bin/python3"
vim.g.loaded_perl_provider = 0

-- encoding
vim.o.encoding = "utf-8"
vim.scriptencoding = "utf-8"

-- visual
-- vim.o.ambiwidth = "double"
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.showtabline = 2

vim.o.visualbell = true
vim.o.number = true
vim.o.showmatch = true
vim.o.showcmd = true
vim.o.matchtime = 1
vim.o.fileformats = unix, dos, mac
vim.o.fileencodings = "utf-8,sjis"

-- search
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.api.nvim_set_keymap("n", "<Esc><Esc>", ":nohl<CR>", { noremap = true, silent = true })

-- -- manipulation
vim.g.mapleader = " "
vim.opt.clipboard:append({ "unnamedplus" })
vim.o.hidden = true
vim.o.ttimeout = true
vim.o.ttimeoutlen = 50

-- directories
local home = vim.fn.expand("$HOME")
vim.fn.mkdir(home .. "/.vim/swp", "p")
vim.o.directory = home .. "/.vim/swp"

vim.fn.mkdir(home .. "/.vim/undo", "p")
vim.o.undofile = true
vim.o.undodir = home .. "/.vim/undo"

vim.o.backup = false
vim.o.writebackup = false

-- views can only be fully collapsed with the global statusline. by avante.nvim
vim.opt.laststatus = 3
