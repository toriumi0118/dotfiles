local M = {
  "elentok/format-on-save.nvim",
  config = function()
    local format_on_save = require("format-on-save")
    local formatters = require("format-on-save.formatters")

    format_on_save.setup({
      experiments = {
        partial_update = 'diff', -- or 'line-by-line'
      },
      exclude_path_patterns = {
        "/node_modules/",
        ".local/share/nvim/lazy",
      },
      formatter_by_ft = {
        -- css = formatters.lsp,
        -- html = formatters.lsp,
        -- java = formatters.lsp,
        -- javascript = formatters.lsp,
        -- json = formatters.lsp,
        -- lua = formatters.lsp,
        -- markdown = formatters.prettierd,
        -- openscad = formatters.lsp,
        -- python = formatters.black,
        -- rust = formatters.lsp,
        -- scad = formatters.lsp,
        -- scss = formatters.lsp,
        -- sh = formatters.shfmt,
        -- terraform = formatters.lsp,
        typescript = formatters.prettierd,
        typescriptreact = formatters.prettierd,
        -- dart = formatters.lsp,
        yaml = formatters.prettierd,

        --         -- Add your own shell formatters:
        --         myfiletype = formatters.shell({ cmd = { "myformatter", "%" } }),

        --         -- Add lazy formatter that will only run when formatting:
        --         my_custom_formatter = function()
        --           if vim.api.nvim_buf_get_name(0):match("/README.md$") then
        --             return formatters.prettierd
        --           else
        --             return formatters.lsp()
        --           end
        --         end,

        --         -- Add custom formatter
        --         filetype1 = formatters.remove_trailing_whitespace,
        --         filetype2 = formatters.custom({
        --           format = function(lines)
        --             return vim.tbl_map(function(line)
        --               return line:gsub("true", "false")
        --             end, lines)
        --           end
        --         }),

        --         -- Concatenate formatters
        --         python = {
        --           formatters.remove_trailing_whitespace,
        --           formatters.shell({ cmd = "tidy-imports" }),
        --           formatters.black,
        --           formatters.ruff,
        --         },

        --         -- Use a tempfile instead of stdin
        --         go = {
        --           formatters.shell({
        --             cmd = { "goimports-reviser", "-rm-unused", "-set-alias", "-format", "%" },
        --             tempfile = function()
        --               return vim.fn.expand("%") .. '.formatter-temp'
        --             end
        --           }),
        --           formatters.shell({ cmd = { "gofmt" } }),
        --         },

        --         -- Add conditional formatter that only runs if a certain file exists
        --         -- in one of the parent directories.
        --         javascript = {
        --           formatters.if_file_exists({
        --             pattern = ".eslintrc.*",
        --             formatter = formatters.eslint_d_fix
        --           }),
        --           formatters.if_file_exists({
        --             pattern = { ".prettierrc", ".prettierrc.*", "prettier.config.*" },
        --             formatter = formatters.prettierd,
        --           }),
        --           -- By default it stops at the git repo root (or "/" if git repo not found)
        --           -- but it can be customized with the `stop_path` option:
        --           formatters.if_file_exists({
        --             pattern = ".prettierrc",
        --             formatter = formatters.prettierd,
        --             stop_path = function()
        --               return "/my/custom/stop/path"
        --             end
        --           }),
        --         },
      },
    })
  end
}

return { M }
