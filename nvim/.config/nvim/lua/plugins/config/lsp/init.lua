return function()
	local lspconfig = safe_require 'lspconfig'
	local mason_lspconfig = safe_require 'mason-lspconfig'

	if not lspconfig or not mason_lspconfig then
		return
	end

	local on_attach = require 'plugins.config.lsp.on-attach'
	local servers_config = require 'plugins.config.lsp.servers-config'

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

	mason_lspconfig.setup()
	mason_lspconfig.setup_handlers {
		function(server)
			local config = servers_config[server] or {}
			config.on_attach = on_attach
			config.capabilities = capabilities
			lspconfig[server].setup(config)
		end,
	}

	local lsp_signature = safe_require 'lsp_signature'
	if not lsp_signature then
		return
	end

	-- lsp_signature.setup {
	-- 	hint_enable = false,
	-- }
end
