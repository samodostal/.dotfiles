return {
	setup = function()
		local modules = require 'core.statusline.modules'

		return table.concat {
			modules.mode(),
			modules.fileInfo(),
			modules.git(),

			'%=',
			'%=',

			modules.LSP_Diagnostics(),

			modules.copilot_status(),
			modules.lsp_status(),
			modules.linters_status(),
			modules.formatters_status(),

			modules.cwd(),
			modules.cursor_position(),
		}
	end,
}
