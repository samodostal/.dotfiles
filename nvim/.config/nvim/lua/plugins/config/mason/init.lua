return function()
	local mason = safe_require 'mason'
	local mason_tool_installer = safe_require 'mason-tool-installer'

	if not mason or not mason_tool_installer then
		return
	end

	local packages = require 'plugins.config.mason.packages'
	local utils = require 'core.utils'

	mason.setup()

	mason_tool_installer.setup {
		ensure_installed = utils.merge_tables(packages.lsp, packages.dap)
	}
end
