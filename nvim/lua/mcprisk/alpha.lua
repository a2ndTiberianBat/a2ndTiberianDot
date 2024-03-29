local alpha_present, alpha = pcall(require, "alpha")
if not alpha_present then
    DefaultError("alpha", "alpha.lua")
    return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
    " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
    " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
    " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
    " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
    " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
    " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
}
dashboard.section.buttons.val = {
    dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
    dashboard.button("t", "󱎸  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("p", "  Find projects", ":Telescope projects <CR>"),
    dashboard.button("n", "  Open notes", ":Neorg workspace notes <CR>"),
    dashboard.button("w", "󰖬  Open wiki", ":Neorg workspace wiki <CR>"),
    dashboard.button("e", "  Open Explorer", ":Neotree <CR>"),
    dashboard.button("q", "󰗼  Quit Neovim", ":qa<CR>"),
}
alpha.setup(dashboard.opts)
