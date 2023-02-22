return function()
	local mason = safe_require 'mason'
	local mason_settings = safe_require 'mason.settings'
	local mason_installer = safe_require 'mason-tool-installer'

	if not mason or not mason_settings or not mason_installer then
		return
	end

	local packages = require 'plugins.config.mason.packages'
	local utils = require 'core.utils'

	mason.setup()

	mason_installer.setup {
		ensure_installed = utils.merge_tables(packages.lsp, packages.dap),
	}

	-- Settings

	mason_settings.set {
		ui = {
			border = 'rounded',
		},
	}
end
