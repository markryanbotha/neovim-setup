local cmp = require "cmp"
cmp.setup {
  -- other settings and stuff
  enabled = function()
    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
  end,
}

cmp.setup.filetype({ "dap-repl", "dapui_watches" }, {
  sources = {
    { name = "dap" },
  },
})
