local tree_present, tree = pcall(require, "nvim-tree")
if not tree_present then
    DefaultError("nvim-tree", "tree.lua")
    return
end

local config_present, tree_config = pcall(require, "nvim-tree.config")
if not config_present then
    DefaultError("nvim-tree.config", "tree.lua")
    return
end

local tree_cb = tree_config.nvim_tree_callback

tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {
        "startify",
        "dashboard",
        "alpha",
    },
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    system_open = {
        cmd = nil,
        args = {},
    },
    filters = {
        dotfiles = false,
        custom = {},
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = "left",
        mappings = {
            custom_only = false,
            list = {
                { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
                { key = "h", cb = tree_cb "split" },
                { key = "v", cb = tree_cb "vsplit" },
            },
        },
        number = false,
        relativenumber = false,
    },
    renderer = {
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                git = {
                    unstaged = "",
                    staged = "",
                    unmerged = "",
                    renamed = "",
                    deleted = "",
                    untracked = "",
                    ignored = "◌",
                },
                folder = {
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                },
            },
            webdev_colors = true,
        },
        highlight_git = true,
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    actions = {
        open_file = {
            quit_on_open = false,
            window_picker = {
                enable = true,
            },
        },
    },
}
