return function(client, bufnr)
	if client.name ~= 'efm' then
		client.server_capabilities.documentFormattingProvider = false
	end

	local navic = safe_require 'nvim-navic'
	if navic ~= nil and client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end

	local inlayhints = safe_require 'lsp-inlayhints'
	if inlayhints ~= nil then
		inlayhints.on_attach(client, bufnr)
	end
end
