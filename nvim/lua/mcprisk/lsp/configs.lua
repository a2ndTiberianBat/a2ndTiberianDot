-- Ensure both the lsp_installer and lspconfig modules are present
local install_present, lsp_installer = pcall(require, "nvim-lsp-installer")
if not install_present then
    DefaultError("nvim-lsp-installer", "lsp/configs.lua")
    return
end

local config_present, lspconfig = pcall(require, "lspconfig")
if not config_present then
    DefaultError("lspconfig", "lsp/configs.lua")
    return
end

local servers = { "clangd", "pyright" }

lsp_installer.setup {
    ensure_installed = servers
}

for _, server in pairs(servers) do
    local opts = {
        on_attach = require("mcprisk.lsp.handlers").on_attach,
        capabilities = require("mcprisk.lsp.handlers").capabilities,
    }
    local has_custom_opts, server_custom_opts = pcall(require, "mcprisk.lsp.settings." .. server)
    if has_custom_opts then
        opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
    end
    lspconfig[server].setup(opts)
end
