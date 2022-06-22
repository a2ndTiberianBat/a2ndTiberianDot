-- If using Neovim Theme:
local colorscheme = "tokyonight"

local present, _ = pcall(require, colorscheme)
if not present then
    DefaultError(colorscheme, "colorscheme.lua")
    return
end

vim.cmd("colorscheme " .. colorscheme)
