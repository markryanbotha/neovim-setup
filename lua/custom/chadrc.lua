---@type ChadrcConfig
local M = {}
M.ui = { theme = "catppuccin", transparency = true }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

local opt = vim.opt
opt.clipboard = ""

-- Keep the cursor in the center of the screen when moving up or down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Use relative line numbers
vim.wo.relativenumber = true

return M
