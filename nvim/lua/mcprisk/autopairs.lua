local pairs_present, pairs = pcall(require, "nvim-autopairs")
if not pairs_present then
    DefaultError("nvim-autopairs", "autopairs.lua")
    return
end

pairs.setup {
    check_ts = true,
    ts_config = {
        lua = { "string", "source" },
        javascript = { "string", "template_string" },
        java = false,
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'", "<" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0, -- Offset from pattern match
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
    },
}

local aupairs_cmp = require "nvim-autopairs.completion.cmp"
local present, cmp = pcall(require, "cmp")
if not present then
    DefaultError("cmp", "autopairs.lua")
    return
end

cmp.event:on("confirm_done",
    aupairs_cmp.on_confirm_done { map_char = { tex = "" } })
