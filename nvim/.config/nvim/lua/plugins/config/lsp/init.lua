return function()
	local setup_language_servers = require 'plugins.config.lsp.language-servers'
	local setup_autocompletion = require 'plugins.config.lsp.cmp'
	local setup_extras = require 'plugins.config.lsp.extras'

	setup_language_servers()
	setup_autocompletion()
	setup_extras()
end
