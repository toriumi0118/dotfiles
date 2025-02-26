local M = {
  'nvim-lualine/lualine.nvim',
  opts = {
    sections = {
      lualine_c = { { 'filename', path = 1 } }
    }
  }
}

return { M }
