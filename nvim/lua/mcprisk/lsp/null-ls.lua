local null_ls_present, null_ls = pcall(require, "null-ls")
if not null_ls_present then
    DefaultError("null-ls", "lsp/null-ls.lua")
    return
end

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = false,
    sources = {
        formatting.stylua.with({ extra_args = { "--search-parent-directories", }, }),
        formatting.black.with({ extra_args = { "--fast", }, }),
    },
})
