-- スクリーン分割
vim.keymap.set({ 'n', 'v' }, 's', '<Nop>')
vim.keymap.set('n', 'sj', '<C-w>j')
vim.keymap.set('n', 'sk', '<C-w>k')
vim.keymap.set('n', 'sl', '<C-w>l')
vim.keymap.set('n', 'sh', '<C-w>h')
vim.keymap.set('n', 'sJ', '<C-w>J')
vim.keymap.set('n', 'sK', '<C-w>K')
vim.keymap.set('n', 'sL', '<C-w>L')
vim.keymap.set('n', 'sH', '<C-w>H')
vim.keymap.set('n', 's=', '<C-w>=')
vim.keymap.set('n', 'so', '<C-w>_<C-w>|')
vim.keymap.set('n', 'ss', ':sp<CR>')
vim.keymap.set('n', 'sv', ':vs<CR>')
vim.keymap.set('n', 's>', '<C-w>>')
vim.keymap.set('n', 's<', '<C-w><')
vim.keymap.set('n', 's+', '<C-w>+')
vim.keymap.set('n', 's-', '<C-w>-')

-- タブ操作
vim.keymap.set('n', 'st', ':tab split<CR>', { silent = true })   -- 現在のバッファを新規タブで複製
vim.keymap.set('n', 'sn', ':tabnext<CR>', { silent = true })     -- 次のタブへ
vim.keymap.set('n', 'sp', ':tabprevious<CR>', { silent = true }) -- 前のタブへ
vim.keymap.set('n', 'sx', ':tabclose<CR>', { silent = true })    -- タブを閉じる
vim.keymap.set('n', 'sN', ':tabnew<CR>', { silent = true })      -- 新規タブを開く

-- 特定の番号のタブに移動（s1〜s9）
for i = 1, 9 do
  vim.keymap.set('n', 's' .. i, ':tabnext ' .. i .. '<CR>', { silent = true })
  vim.keymap.set('n', 'sm' .. i, ':tabmove ' .. i .. '<CR>', { silent = true })
end

vim.keymap.set("n", "cp", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
end, { desc = "Copy file path to clipboard" })
