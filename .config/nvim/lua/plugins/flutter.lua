local M = {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require("flutter-tools").setup {
      flutter_path = nil,
      flutter_lookup_cmd = "asdf where flutter",
      fvm = false,
      lsp = {
        on_attach = On_attach,
      },
      settings = {
        enableSnippets = false
      }
    }
  end
}

return { M }
