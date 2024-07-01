return function(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.semanticTokensProvider = nil

	local packages = require 'plugins.config.mason.packages'
	local disable_inlayhints = vim.tbl_contains(packages.disable_inlayhints, client.name)

	local inlayhints = safe_require 'lsp-inlayhints'
	if inlayhints ~= nil and not disable_inlayhints then
		inlayhints.on_attach(client, bufnr)
	end
end
