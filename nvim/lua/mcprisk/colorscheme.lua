local colorscheme = "nightfox"

local colorscheme_present = preq(colorscheme, "colorscheme.lua")
if colorscheme_present then vim.cmd("colorscheme " .. colorscheme) end
