local bufferline_present, bufferline = pcall(require, "bufferline")
if not bufferline_present then
    DefaultError("bufferline", "bufferline.lua")
    return
end

bufferline.setup {
    options = {
        mode = "buffer",
        numbers = "ordinal",

        show_close_icon = false,
        show_buffer_close_icons = false,

        diagnostics = "nvim_lsp",

        close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"

        offsets = { { filetype = "NvimTree", text = "File Explorer", text_allign = "center", padding = 1 } },

        separator_style = "thin"
    },
}
