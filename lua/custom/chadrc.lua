---@type ChadrcConfig
local M = {}
M.ui = { theme = "catppuccin", transparency = true }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

--indenting
local opt = vim.opt
opt.shiftwidth = 2
opt.clipboard = ""

return M
