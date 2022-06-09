local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")
local servers = lsp_installer.get_installed_servers();

local server_table = {}

for idx in pairs(servers) do
	local server = servers[idx].name
	table.insert(server_table, server)
end

lsp_installer.setup {
	ensure_installed = server_table
}

for _, server in ipairs(server_table) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
	 	opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
end
