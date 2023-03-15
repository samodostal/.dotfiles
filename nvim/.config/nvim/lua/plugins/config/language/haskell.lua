return function()
	local haskell_tools = safe_require 'haskell-tools'
	if not haskell_tools then
		return
	end

	local on_attach = require 'plugins.config.lsp.on-attach'

	local language_server_mason_command = vim.fn.stdpath 'data'
		.. '/mason/packages/haskell-language-server/bin/haskell-language-server-wrapper'

	haskell_tools.setup {
		hls = {
			cmd = { language_server_mason_command, '--lsp' },
			on_attach = on_attach
		},
	}
end
