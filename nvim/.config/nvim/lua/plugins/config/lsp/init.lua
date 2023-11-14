return function()
	local setup_language_servers = require 'plugins.config.lsp.language-servers'
	local setup_autocompletion = require 'plugins.config.lsp.cmp'
	local setup_linters = require 'plugins.config.lsp.lint'
	local setup_formatting = require 'plugins.config.lsp.format'
	local setup_extras = require 'plugins.config.lsp.extras'

	setup_language_servers()
	setup_autocompletion()
	setup_linters()
	setup_formatting()
	setup_extras()
end
