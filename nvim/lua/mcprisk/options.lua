local o = vim.opt

o.clipboard = "unnamedplus"
o.cmdheight = 2
o.completeopt = {"menuone","noselect"}
o.confirm = true
o.cursorline = true
o.expandtab = true
o.hlsearch = true
o.ignorecase = true
o.iskeyword:append "-"
o.mouse = "a"
o.number = true
o.numberwidth = 4
-- Add the following to keybind in the future:
-- o.relativenumber = true
o.pumheight = 10
o.scrolloff = 8
o.shiftround = true
o.shiftwidth = 4
o.shortmess:append "c"
o.showmode = false
o.showtabline = 2
o.sidescrolloff = 12
o.signcolumn = "yes"
o.smartcase = true
o.smartindent = true
o.softtabstop = -1
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.tabstop = 4
o.termguicolors = true
o.timeoutlen = 100
o.undofile = true
o.whichwrap:append "h,l,<,>,[,]"
o.wrap = false
