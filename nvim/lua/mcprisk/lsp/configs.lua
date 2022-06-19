-- Ensure both the lsp_installer and lspconfig modules are present
local lsp_installer = preq("nvim-lsp-installer", "lsp/configs.lua")
local lspconfig = preq("lspconfig", "lsp/configs.lua")
if not lsp_installer or not lspconfig then return end

local servers = { "sumneko_lua" }

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
