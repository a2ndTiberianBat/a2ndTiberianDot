local neorg_present, neorg = pcall(require, "neorg")
if not neorg_present then
    DefaultError("neorg", "neorg.lua")
    return
end

neorg.setup {
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {
            config = {
                icon_preset="diamond",
            },
        }, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    notes = "~/notes",
                    wiki = "~/wiki",
                },
                autodetect = true,
                autochdir = true,           },
        },
        ["core.ui.calendar"] = {},
        ["core.summary"] = {},
        ["core.completion"] = { 
            config = { engine = "nvim-cmp" }, 
        },
        ["core.integrations.nvim-cmp"] = {},
        ["core.keybinds"] = {
            config = {
                hook = function(keybinds)
                    keybinds.map("norg", "n", "gj", "<cmd>Neorg keybind norg core.manoeuvre.item_down<cr>")
                    keybinds.map("norg", "n", "gk", "<cmd>Neorg keybind norg core.manoeuvre.item_up<cr>")
                    keybinds.map("norg", "n", "]s", "<cmd>Neorg keybind norg core.integrations.treesitter.next.heading<cr>")
                    keybinds.map("norg", "n", "[s", "<cmd>Neorg keybind norg core.integrations.treesitter.previous.heading<cr>")
                    keybinds.map("norg", "n", "<leader>nc", "<cmd>Neorg keybind norg core.tempus.insert-date<cr>")

                    -- Keybinds for the journal module
                    keybinds.map("norg", "n", "<leader>njc", '<cmd>Neorg journal custom<cr>')
                    keybinds.map("norg", "n", "<leader>njf", '<cmd>Neorg journal tomorrow<cr>')
                    keybinds.map("norg", "n", "<leader>njy", '<cmd>Neorg journal yesterday<cr>')
                end,
            }
        },
    }
}
