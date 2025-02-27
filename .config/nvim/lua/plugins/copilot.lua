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
        debounce = 75,
        keymap = {
          accept = "<Tab>",
          next = "<C-k><C-k>",
          prev = "<C-i><C-i>",
          dismiss = false
        },
      },
      filetypes = {
        yaml = true,
        cvs = true,
      },
    })
  end,
}

return { M }
