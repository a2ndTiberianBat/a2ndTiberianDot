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
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
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
    use "kyazdani42/nvim-tree.lua"
    -- Git Integration
    use "lewis6991/gitsigns.nvim"
    -- Comments
    use "numToStr/Comment.nvim"
    use "JoosepAlviste/nvim-ts-context-commentstring"
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
    -- Sync Packer after Cloning
    if PACKER_BOOTSTRAP then
        packer.sync()
    end
end)
