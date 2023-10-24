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
-- Better Saving / Quitting
keybind("n", "<leader>w", ":w<CR>", opts)
keybind("n", "<leader>W", ":wa<CR>", opts)
keybind("n", "<leader>q", ":q<CR>", opts)
keybind("n", "<leader>Q", ":qa<CR>", opts)
-- Window Creation / Deletion
keybind("n", "<leader>S", ":split<CR>", opts)
keybind("n", "<leader>s", ":vsplit<CR>", opts)
keybind("n", "<leader>d", "<C-w>q", opts)
-- Window Navigation
keybind("n", "<C-h>", "<C-w>h", opts)
keybind("n", "<C-j>", "<C-w>j", opts)
keybind("n", "<C-k>", "<C-w>k", opts)
keybind("n", "<C-l>", "<C-w>l", opts)
-- Window Resizing (Arrow Keys)
keybind("n", "<C-Up>", ":resize -2<CR>", opts)
keybind("n", "<C-Down>", ":resize +2<CR>", opts)
keybind("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keybind("n", "<C-Right>", ":vertical resize -2<CR>", opts)
-- Buffer Navigation
keybind("n", "<C-b>", ":BufferLine")
keybind("n", "<A-l>", ":BufferLineCycleNext<CR>", opts)
keybind("n", "<A-h>", ":BufferLineCyclePrev<CR>", opts)
keybind("n", "<A-L>", ":BufferLineMoveNext<CR>", opts)
keybind("n", "<A-H>", ":BufferLineMovePrev<CR>", opts)
keybind("n", "<A-b>", ":BufferLineGoToBuffer", opts)
keybind("n", "<A-p>", ":BufferLineTogglePin<CR>", opts)
keybind("n", "<A-d>", ":Bdelete<CR>", opts)
-- Toggle Relative Line Numbers
keybind("n", "<leader>tn", ":set relativenumber!<CR>", opts)
-- Toggle Mouse Support
keybind("n", "<leader>tm", ':lua Toggle("mouse","a","")<CR>', opts)
-- Toggle Light Mode
keybind("n", "<leader>tb", ':lua Toggle("background","light","dark")<CR>', opts)
-- Deactivate Highlighting Until Next Search
keybind("n", "<leader>tc", ":noh<CR>", opts)
-- Move Line of Text
keybind("n", "<A-j>", ":m .+1<CR>", opts)
keybind("n", "<A-k>", ":m .-2<CR>", opts)
keybind("n", "<A-J>", ":m .+10<CR>", opts)
keybind("n", "<A-K>", ":m .-11<CR>", opts)
-- DAP Shortcuts
keybind("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keybind("n", "<leader>bc", "<cmd>lua require'dap'.continue()<cr>", opts)
keybind("n", "<leader>bi", "<cmd>lua require'dap'.step_into()<cr>", opts)
keybind("n", "<leader>bo", "<cmd>lua require'dap'.step_over()<cr>", opts)
keybind("n", "<leader>bO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keybind("n", "<leader>br", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keybind("n", "<leader>bl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keybind("n", "<leader>bu", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keybind("n", "<leader>bt", "<cmd>lua require'dap'.terminate()<cr>", opts)
-- Telescope Searching
keybind("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keybind("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
-- Formatting
keybind("n", "<leader>fm", ":lua vim.lsp.buf.format { async = true }<CR>", opts)
-- Open NeoTree
keybind("n", "<leader>e", ":Neotree toggle <CR>", opts)
-- Comment line
keybind("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
-- Use Shift-V Visual Mode by Default
keybind("n", "v", "V", opts)
keybind("n", "V", "v", opts)
-- Enter Visual Block Mode
keybind("n", "vb", "<C-q>", opts)
-----------------------------
-- Insert Mode Keybindings --
-----------------------------
-- Move Line of Text
keybind("i", "<A-j>", "<ESC>:m .+1<CR>==gi", opts)
keybind("i", "<A-k>", "<ESC>:m .-2<CR>==gi", opts)
keybind("i", "<A-J>", "<ESC>:m .+10<CR>==gi", opts)
keybind("i", "<A-K>", "<ESC>:m .-11<CR>==gi", opts)
-----------------------------
-- Visual Mode Keybindings --
-----------------------------
-- Exit Visual Mode
keybind("v", "vv", "<ESC>", opts)
-- Move Text Blocks
keybind("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keybind("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keybind("v", "<A-J>", ":m '>+10<CR>gv=gv", opts)
keybind("v", "<A-K>", ":m '<-11<CR>gv=gv", opts)
-- Stay in Visual Mode when Indenting
keybind("v", "<", "<gv", opts)
keybind("v", ">", ">gv", opts)
-- Quick tabbing
keybind("v", ",", "<", opts)
keybind("v", ".", ">", opts)
-----------------------------------
-- Visual Block Mode Keybindings --
-----------------------------------
keybind("x", "vv", "<ESC>", opts)
-- keybind("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')
