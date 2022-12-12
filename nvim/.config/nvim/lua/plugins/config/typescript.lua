return function()
	local typescript = safe_require 'typescript'
	if not typescript then
		return
	end

	local on_attach = require 'plugins.config.lsp.on-attach'

	typescript.setup {
		server = {
			on_attach = on_attach,
		},
	}
end
