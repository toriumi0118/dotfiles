local M = {
  {
    "lambdalisue/fern.vim",
    lazy = false,
    keys = {
      {
        "<C-n>",
        ":Fern . -reveal=% -drawer -toggle -width=40<CR>",
        desc = "toggle fern"
      },
      {
        "sg",
        ":Fern . -drawer -reveal=% -width=40 -wait<CR><C-w>=",
        desc = "jump to current file",
        mode = "n",
        noremap = true,
        silent = true
      },
    },
    dependencies = {
      { 'lambdalisue/nerdfont.vim' },
      {
        'lambdalisue/fern-renderer-nerdfont.vim',
        config = function()
          vim.g['fern#renderer'] = "nerdfont"
        end
      },
      { 'lambdalisue/fern-git-status.vim' }
    },
  }
}

local function init_fern()
  local opts = { noremap = false, silent = true, buffer = true, nowait = true }

  local map = function(lhs, rhs)
    vim.keymap.set('n', lhs, rhs, opts)
  end

  map('o', '<Plug>(fern-action-open:edit)')
  map('go', '<Plug>(fern-action-open:edit)<C-w>p')
  map('t', '<Plug>(fern-action-open:tabedit)')
  map('T', '<Plug>(fern-action-open:tabedit)gT')
  map('i', '<Plug>(fern-action-open:split)')
  map('gi', '<Plug>(fern-action-open:split)<C-w>p')
  map('e', '<Plug>(fern-action-open:vsplit)')
  map('ge', '<Plug>(fern-action-open:vsplit)<C-w>p')
  map('ma', '<Plug>(fern-action-new-path)')
  map('r', '<Plug>(fern-action-rename:bottom)')

  map('C', '<Plug>(fern-action-enter)<Plug>(fern-wait)<Plug>(fern-action-tcd:root)')
  map('U', '<Plug>(fern-action-leave)<Plug>(fern-wait)<Plug>(fern-action-tcd:root)')
  map('R', 'gg<Plug>(fern-action-reload)<C-o>')
  map('cd', '<Plug>(fern-action-cd)')
  map('CD', 'gg<Plug>(fern-action-cd)<C-o>')

  map('I', '<Plug>(fern-action-hidden:toggle)')
  map('l', '<Plug>(fern-action-expand)')
  map('<CR>', '<Plug>(fern-my-expand-or-collapse)')
  map('q', ':quit<CR>')

  -- 関数を用いたマッピング
  vim.keymap.set('n', '<Plug>(fern-my-expand-or-collapse)', function()
    return vim.fn['fern#smart#leaf'](
      '<Plug>(fern-action-open:edit)',
      '<Plug>(fern-action-expand)',
      '<Plug>(fern-action-collapse)'
    )
  end, { expr = true, buffer = true })

  -- デフォルトマッピングの削除
  pcall(vim.keymap.del, 'n', 's', { buffer = true })
  pcall(vim.keymap.del, 'n', 'z', { buffer = true })
end

-- autocmd の設定
vim.api.nvim_create_augroup('fern_custom', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = 'fern_custom',
  pattern = 'fern',
  callback = init_fern,
})

vim.api.nvim_create_augroup("fern_startup", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
  group = 'fern_startup',
  pattern = "*",
  nested = true,
  command = "silent! lcd %:h | Fern . -reveal=% -drawer -toggle -width=40"
})

return { M }
