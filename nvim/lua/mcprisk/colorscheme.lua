-- If using Neovim Theme:
local colorscheme = "tokyonight"

local scheme_present, _ = pcall(require, colorscheme)
if not scheme_present then
    DefaultError(colorscheme, "colorscheme.lua")
    return
end

vim.cmd("colorscheme " .. colorscheme)
