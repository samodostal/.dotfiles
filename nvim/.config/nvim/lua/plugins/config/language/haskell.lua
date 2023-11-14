return function()
	local haskell_tools = safe_require 'haskell-tools'
	if not haskell_tools then
		return
	end

	local on_attach = require 'plugins.config.lsp.on-attach'

	vim.g.haskell_tools = {
		hls = {
			on_attach = on_attach,
		},
	}
end
