-- custom/configs/null-ls.lua

local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

--for prettier
local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"
local setup_prettier = function(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    -- format on save
    vim.api.nvim_clear_autocmds { buffer = bufnr, group = group }
    vim.api.nvim_create_autocmd(event, {
      buffer = bufnr,
      group = group,
      callback = function()
        vim.lsp.buf.format { bufnr = bufnr, async = async }
      end,
      desc = "[lsp] format on save",
    })
  end
end

local sources = {
  formatting.stylua,
  formatting.prettierd.with {
    env = {
      PRETTIERD_DEFAULT_CONFIG = vim.fn.expand "~/.config/nvim/utils/linter-config/.prettierrc.json",
    },
  },

  lint.shellcheck,
  lint.fish,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = setup_prettier,
}
