local M = {}

-- In order to disable a default keymap, use
M.disabled = {}

-- Your custom mappings
M.custom = {
  n = {
    ["<leader>y"] = { '"+y', "Copy to clipboard" },
    ["<leader>d"] = { '"+d', "Cut to clipboard" },

    --lazygit
    ["<leader>gl"] = { "<cmd>LazyGit<cr>", "Open Lazy Git floating window" },

    -- jest and debugging
    ["<leader>jr"] = {
      function()
        require("jester").run()
      end,
      "Run jest test under cursor",
    },
    ["<leader>jd"] = {
      function()
        require("jester").debug()
      end,
      "Debug jest test under cursor",
    },
    ["<leader>jb"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Toggle Break Point",
    },
    ["<leader>jc"] = {
      function()
        require("dap").continue()
      end,
      "Continue debugging",
    },
    ["<leader>jh"] = {
      function()
        require("dapui").eval()
      end,
      "Hover and evaulate element",
    },

    ["<leader>tt"] = {
      "<cmd>TroubleToggle<cr>",
      "Toggle Workspace Diagnostics",
    },
    ["<leader>s"] = {
      [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
      "Rename current word under cursor",
    },
    ["<leader>cr"] = {
      "<cmd>Telescope lsp_references<cr>",
      "Get usage of hovered variable with Telescope",
    },
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
    -- Run File
    ["<leader>R"] = { "<cmd> %SnipRun <CR>", "run current file" },
  },
  v = {
    ["<leader>y"] = { '"+y', "Copy to clipboard" },
    ["<leader>d"] = { '"+d', "Cut to clipboard" },
    ["J"] = {
      ":m '>+1<CR>gv=gv",
      "Move text up",
    },
    ["K"] = {
      ":m '<-2<CR>gv=gv",
      "Move text down",
    },
    -- Run  selection
    ["<leader>R"] = { "<cmd> '<,'>SnipRun <CR>", "run selection" },
  },
}

return M
