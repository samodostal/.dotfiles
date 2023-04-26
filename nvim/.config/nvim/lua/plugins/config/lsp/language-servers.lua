return function()
	local lspconfig = safe_require 'lspconfig'
	local mason_lspconfig = safe_require 'mason-lspconfig'
	local neodev = safe_require 'neodev'

	if not lspconfig or not mason_lspconfig or not neodev then
		return
	end

	-- Needs to be set-up before any other LSP server
	neodev.setup {}

	local packages = require 'plugins.config.mason.packages'
	local on_attach = require 'plugins.config.lsp.on-attach'
	local servers_config = require 'plugins.config.lsp.configurations'

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

	mason_lspconfig.setup()
	mason_lspconfig.setup_handlers {
		function(server)
			if not vim.tbl_contains(packages.managed_separately, server) then
				local config = servers_config[server] or {}
				config.on_attach = on_attach
				config.capabilities = capabilities

				lspconfig[server].setup(config)
			end
		end,
	}
end
