local configs_present, ts_configs = pcall(require, "nvim-treesitter.configs")
if not configs_present then
    DefaultError("nvim-treesitter.configs", "treesitter.lua")
    return
end

ts_configs.setup {
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
        disable = { "lua" }
    },
}
