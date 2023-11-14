return function()
	local mason = safe_require 'mason'
	local mason_settings = safe_require 'mason.settings'
	local mason_installer = safe_require 'mason-tool-installer'

	if not mason or not mason_settings or not mason_installer then
		return
	end

	local packages = require 'plugins.config.mason.packages'
	local utils = require 'core.utils'

	local packages_linters = {}
	for _, ft_with_linters in pairs(packages.linters_with_ft) do
		for _, package in ipairs(ft_with_linters) do
			table.insert(packages_linters, package)
		end
	end

	local packages_formatters = {}
	for _, ft_with_formatters in pairs(packages.formatters_with_ft) do
		for _, package in ipairs(ft_with_formatters) do
			local package_parsed = package:gsub('_', '-') -- Conform.nvim names some packages with '_' instead of correctly using '-'. :/
			table.insert(packages_formatters, package_parsed)
		end
	end

	mason.setup()

	mason_installer.setup {
		ensure_installed = utils.merge_tables(packages.lsp, packages.dap, packages_linters, packages_formatters),
	}

	-- Settings

	mason_settings.set {
		ui = {
			border = 'rounded',
		},
	}
end
