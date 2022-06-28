---------------------
-- Local Variables --
---------------------
local opts = { noremap = true, silent = true }
local keybind = vim.api.nvim_set_keymap
---------------------------
-- Leader Key Keybinding --
---------------------------
keybind("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-----------------------------
-- Normal Mode Keybindings --
-----------------------------
-- Window Creation
keybind("n", "<leader>h", ":split<CR>", opts)
keybind("n", "<leader>v", ":vsplit<CR>", opts)
-- Window Navigation
keybind("n", "<C-h>", "<C-w>h", opts)
keybind("n", "<C-j>", "<C-w>j", opts)
keybind("n", "<C-k>", "<C-w>k", opts)
keybind("n", "<C-l>", "<C-w>l", opts)
-- Window Resizing (Arrow Keys)
keybind("n", "<C-Up>", ":resize -2<CR>", opts)
keybind("n", "<C-Down>", ":resize +2<cr>", opts)
keybind("n", "<C-Left>", ":vertical resize +2<cr>", opts)
keybind("n", "<C-Right>", ":vertical resize -2<cr>", opts)
-- Toggle Relative Line Numbers
keybind("n", "<leader>n", ":set relativenumber!<CR>", opts)
-- Toggle Mouse Support
keybind("n", "<leader>m", ':lua Toggle("mouse","a","")<CR>', opts)
-- Toggle Light Mode
keybind("n", "<leader>/", ':lua Toggle("background","light","dark")<CR>', opts)
-- Deactivate Highlighting Until Next Search
keybind("n", "<leader>c", ":noh<CR>", opts)
-- Move Line of Text
keybind("n", "<A-k>", ":m .-2<CR>", opts)
keybind("n", "<A-j>", ":m .+1<CR>", opts)
-- Use Shift-V Visual Mode by Default
keybind("n", "v", "V", opts)
keybind("n", "V", "v", opts)
-- Telescope Searching
keybind("n", "<leader>f", ":Telescope find_files<CR>", opts)
keybind("n", "<C-t>", ":Telescope live_grep<CR>", opts)
-- Open nvim-tree
keybind("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
-----------------------------
-- Insert Mode Keybindings --
-----------------------------
-- Move Line of Text
keybind("i", "<A-j>", "<ESC>:m .+1<CR>==gi", opts)
keybind("i", "<A-k>", "<ESC>:m .-2<CR>==gi", opts)
-----------------------------
-- Visual Mode Keybindings --
-----------------------------
-- Exit Visual Mode
keybind("v", "vv", "<ESC>", opts)
-- Move Text Blocks
keybind("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keybind("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
-- Stay in Visual Mode when Indenting
keybind("v", "<", "<gv", opts)
keybind("v", ">", ">gv", opts)
-- Quick tabbing
keybind("v", ",", "<", opts)
keybind("v", ".", ">", opts)
