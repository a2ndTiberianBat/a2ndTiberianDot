-- Automatically install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system {
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Ensure Packer is properly installed
local packer_present, packer = pcall(require, "packer")
if not packer_present then
    DefaultError("packer", "plugins.lua")
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install Plugins
return packer.startup(function(use)
    -- Packer and Resources
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "kyazdani42/nvim-web-devicons"
    -- Colorschemes
    use "folke/tokyonight.nvim"
    -- cmp
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    -- snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"
    -- LSP
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "jose-elias-alvarez/null-ls.nvim"
    -- GDB
    use 'sakhnik/nvim-gdb'
    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-media-files.nvim"
    use "BurntSushi/ripgrep"
    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    -- Buffer and status lines
    use "akinsho/bufferline.nvim"
    use "nvim-lualine/lualine.nvim"
    -- File Explorer
    use {
    "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = { 
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        }
    }
    -- Git Integration
    use "lewis6991/gitsigns.nvim"
    -- Comments
    use "numToStr/Comment.nvim"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    -- DAP
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    -- Markdown Previewer
    use({ "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    })
    -- QOL Improvements
    use "windwp/nvim-autopairs"
    use "jghauser/mkdir.nvim"
    use "max397574/better-escape.nvim"
    use "rcarriga/nvim-notify"
    use "moll/vim-bbye"
    use "lukas-reineke/indent-blankline.nvim"
    use "lewis6991/impatient.nvim"
    use "goolord/alpha-nvim"
    -- Neorg
    use {
        "nvim-neorg/neorg",
        run = ":Neorg sync-parsers",
        requires = "nvim-lua/plenary.nvim",
    }
    -- Toggleterm
    use "akinsho/toggleterm.nvim"
    -- Hex Editing
    use {"RaafatTurki/hex.nvim", require 'hex'.setup()}
    -- Projects
    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            }
        end
    }
    -- AI
    use {"zbirenbaum/copilot.lua",
        config = function()
            require('copilot').setup({
                panel = {
                    enabled = true,
                    auto_refresh = false,
                    keymap = {
                        jump_prev = "[[",
                        jump_next = "]]",
                        accept = "<CR>",
                        refresh = "gr",
                        open = "<M-CR>"
                    },
                    layout = {
                        position = "bottom", -- | top | left | right
                        ratio = 0.4
                    },
                },
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = "<M-l>",
                        accept_word = false,
                        accept_line = false,
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-]>",
                    },
                },
                filetypes = {
                    yaml = false,
                    markdown = false,
                    help = false,
                    gitcommit = false,
                    gitrebase = false,
                    hgcommit = false,
                    svn = false,
                    cvs = false,
                    ["."] = false,
                },
                copilot_node_command = 'node', -- Node.js version must be > 18.x
                server_opts_overrides = {},
            })
        end
    }

    if PACKER_BOOTSTRAP then
        packer.sync()
    end
end)
