local configs = preq("nvim-treesitter.configs", "treesitter.lua")
if not configs then return end

configs.setup {
    ensure_installed = "all",
    sync_install = false,
    ignore_install = { "" },
    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = true,
        disable = { "" }
    },
}