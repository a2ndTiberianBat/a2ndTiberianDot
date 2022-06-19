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
    vim.notify("Packer not installed!")
    return
end

-- Install Plugins
return packer.startup(function(use)
    -- Packer and Resources
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    -- Colorschemes
    use "EdenEast/nightfox.nvim"
    use "lunarvim/colorschemes"
    -- cmp
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    -- snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"
    -- Markdown Previewer
    use({ "iamcco/markdown-preview.nvim", 
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    })
    -- Sync Packer after Cloning
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
