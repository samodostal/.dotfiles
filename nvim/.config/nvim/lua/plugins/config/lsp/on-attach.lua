return function(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false

	local inlayhints = safe_require 'lsp-inlayhints'
	if inlayhints ~= nil then
		inlayhints.on_attach(client, bufnr)
	end
end
